import Foundation

protocol PmzProductVCDelegate {
    func onItemAddedToOrder(order: PmzOrder)
}

class PmzProductViewController: PaymentezViewController, UITableViewDelegate, UITableViewDataSource, ProductConfigurationItemDelegate, ProductFooterDelegate {
    
    public static let TITLE_INDEX = 0
    public static let ITEM_INDEX = 1
    static let PMZ_PRODUCT_VC = "PmzProductVC"
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIView!
    @IBOutlet weak var nextButtonText: PmzLocalizationLabel!
    weak var footerView: ProductFooterView?
    
    var organizer: PmzProductOrganizer
    var product: PmzProduct?
    var orderId: CLong?
    var order: PmzOrder?
    var item: PmzItem?
    weak var store: PmzStore?
    
    var delegate: PmzProductVCDelegate?
    
    var editMode: Bool = false
    
    var currentPrice: Double = 0
    var currentAmount: Int = 1
    
    init() {
        self.organizer = PmzProductOrganizer()
        super.init(nibName: PmzProductViewController.PMZ_PRODUCT_VC, bundle: PaymentezSDK.shared.getBundle())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.goToFourthPage)))
        if let currentPrice = product?.currentPrice {
            self.currentPrice = currentPrice
        }
        setTableView()
        if(editMode) {
            setEditModeAmounts()
            getProduct()
            changeButtonText()
        } else {
            organizer.setProduct(product: product)
            item = PmzItem(product: product!, orderId: orderId)
        }
    }
    
    func changeButtonText() {
        nextButtonText.text = getString("product_modify_item_button")
    }
    
    func setEditModeAmounts() {
        if let quantity = item?.quantity {
            currentAmount = quantity
        }
        if let unitAmount = item?.unitAmount {
            currentPrice = unitAmount
        }
    }
    
    func getProduct() {
        if let storeId = store?.id {
            showLoading()
            API.sharedInstance.getMenu(storeId: storeId, callback: { [weak self] (menu) in
                guard let self = self else { return }
                self.findProduct(menu)
                self.dismissPmzLoading()
                if self.product != nil {
                    self.organizer.editMode = true
                    self.organizer.setProduct(product: self.product)
                    self.organizer.setItem(item: self.item)
                    self.tableView.reloadData()
                } else {
                    self.showGenericErrorWithBack(vc: self)
                }
                }, failure: { [weak self] (error) in
                    guard let self = self else { return }
                    self.dismissPmzLoading()
                    self.showGenericError()
            })
        } else {
            showGenericErrorWithBack(vc: self)
        }
    }
    
    func findProduct(_ menu: PmzMenu) {
        if let itemProductId = item?.productId {
            if let categories = menu.categories {
                for category in categories {
                    if let products = category.products {
                        for product in products {
                            if let productId = product.id, productId == itemProductId {
                                self.product = product
                            }
                        }
                    }
                }
            }
        }
    }
    
    func onQuantityChanged(quantity: Int) {
        item?.quantity = quantity
        currentAmount = quantity
    }
    
    func setTableView() {
        tableView.register(UINib(nibName: "TitleCellView", bundle: Bundle(for: self.classForCoder)), forCellReuseIdentifier: "TitleCellView")
        tableView.register(UINib(nibName: "ProductConfigurationItemCellView", bundle: Bundle(for: self.classForCoder)), forCellReuseIdentifier: "ProductConfigurationItemCellView")
        tableView.register(UINib(nibName: "ProductHeaderView", bundle: Bundle(for: self.classForCoder)), forCellReuseIdentifier: "ProductHeaderView")
        tableView.register(UINib(nibName: "ProductFooterView", bundle: Bundle(for: self.classForCoder)), forCellReuseIdentifier: "ProductFooterView")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return organizer.size() + 2
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductHeaderView") as! ProductHeaderView
            cell.configure(product: product)
            return cell
        }
        if indexPath.row - 1 == organizer.size() {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductFooterView") as! ProductFooterView
            cell.initialize()
            cell.delegate = self
            self.footerView = cell
            cell.currentAmount(amount: currentAmount)
            cell.setCurrentPrice(price: currentPrice + organizer.measureExtras())
            return cell
        }
        let item = organizer.getItem(position: indexPath.row - 1)
        if let type = item?.getType(), type == PmzProductViewController.ITEM_INDEX {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductConfigurationItemCellView") as! ProductConfigurationItemCellView
            cell.configure(item: item as! PmzProductConfiguration, position: indexPath.row - 1)
            cell.delegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCellView") as! TitleCellView
            if item != nil {
                cell.configure(title: item as! PmzTitleItem)
            }
            return cell
        }
    }
    
    func onItemSelected(product: PmzProductConfiguration, cell: ProductConfigurationItemCellView, position: Int) {
        if product.checked {
            if(organizer.canUnselect(position: position)) {
                product.checked = !product.checked
                cell.setPropperImage(product.checked)
                organizer.addSelection(config: product, position: position)
                let itemsToRefresh = organizer.onItemClicked(position: position)
                refreshItems(ids: itemsToRefresh)
            }
        } else {
            product.checked = !product.checked
            cell.setPropperImage(product.checked)
            organizer.addSelection(config: product, position: position)
            let itemsToRefresh = organizer.onItemClicked(position: position)
            refreshItems(ids: itemsToRefresh)
        }
        measurePrice()
    }
    
    func measurePrice() {
        if let price = product?.currentPrice, let footer = footerView {
            footer.setCurrentPrice(price: price + organizer.measureExtras())
        }
    }
    
    func refreshItems(ids: [Int]) {
        var indexes = [IndexPath]()
        for id in ids {
            let index = IndexPath(row: id + 1, section: 0)
            indexes.append(index)
        }
        if indexes.count > 0 {
            tableView.reloadRows(at: indexes, with: .automatic)
        }
    }
    
    @objc func goToFourthPage() {
        showLoading()
        item!.setConfigurations(organizer: organizer)
        if !editMode {
            if order == nil {
                startOrder()
            } else {
                addItemWConfigurations()
            }
        } else {
            removeItemWConfigurations()
        }
    }
    
    func startOrder() {
        if let storeId = store?.id {
            let orderStarter = PmzOrder(buyer: PaymentezSDK.shared.buyer!, appOrderReference: PaymentezSDK.shared.appOrderReference!, storeId: storeId)
            API.sharedInstance.startOrder(order: orderStarter, callback: { [weak self] (order) in
                guard let self = self else { return }
                self.order = order
                self.item?.orderId = order.id
                self.addItemWConfigurations()
                }, failure: { [weak self] (error) in
                    guard let self = self else { return }
                    self.dismissPmzLoading()
                    self.backDidPressed(self)
            })
        } else {
            self.dismissPmzLoading()
            self.showGenericError()
        }
    }
    
    func addItemWConfigurations() {
        API.sharedInstance.addItemWithConfigurations(item: item!, callback: { [weak self] (order) in
            guard let self = self else { return }
            self.sendOrderBack(self.mergeData(order))
            self.dismissPmzLoading()
            }, failure: { [weak self] (error) in
                guard let self = self else { return }
                self.dismissPmzLoading()
                self.showGenericError()
        })
    }
    
    func removeItemWConfigurations() {
        API.sharedInstance.deleteItem(item: item!, callback: { [weak self] (order) in
            guard let self = self else { return }
            self.addItemWConfigurations()
            }, failure: { [weak self] (error) in
                guard let self = self else { return }
                self.dismissPmzLoading()
                self.showGenericError()
        })
    }
    
    func sendOrderBack(_ order: PmzOrder) {
        delegate?.onItemAddedToOrder(order: order)
        backDidPressed(self)
    }
    
    @IBAction func backDidPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func mergeData(_ response: PmzOrder) -> PmzOrder {
        if let items = response.items {
            for item in items {
                if let newProductId = item.productId, let productId = product?.id, productId == newProductId {
                    item.imageUrl = product?.imageUrl
                }
            }
            if let oldItems = order?.items {
                for oldItem in oldItems {
                    for newItem in items {
                        if let newProductId = newItem.id, let oldProductId = oldItem.id, newProductId == oldProductId {
                            newItem.imageUrl = oldItem.imageUrl
                        }
                    }
                }
            }
        }
        return response
    }
}
