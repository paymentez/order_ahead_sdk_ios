//
//  PmzCartViewController.swift
//  Alamofire
//
//  Created by Fennoma on 16/12/2020.
//

import Foundation

class PmzCartViewController: PaymentezViewController, UITableViewDelegate, UITableViewDataSource, CartHeaderDelegate, PmzProductVCDelegate {
    
    static let PMZ_CART_VC = "PmzCartVC"
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIView!
    var footerView: CartFooterView?
    
    var store: PmzStore?
    var order: PmzOrder?
    
    var fromReopen: Bool = false
    var orderModified: Bool = false
    
    init() {
        super.init(nibName: PmzCartViewController.PMZ_CART_VC, bundle: PaymentezSDK.shared.getBundle())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.finishFlow)))
        setColors()
        setTableView()
        if(fromReopen) {
            startSession()
        }
    }
    
    func setColors() {
        if let buttonColor = PaymentezSDK.shared.style?.buttonBackgroundColor {
            changeStatusBarColor(color: buttonColor)
        }
    }
    
    func setTableView() {
        tableView.register(UINib(nibName: "CartItemCellView", bundle: Bundle(for: self.classForCoder)), forCellReuseIdentifier: "CartItemCellView")
        tableView.register(UINib(nibName: "CartHeaderView", bundle: Bundle(for: self.classForCoder)), forCellReuseIdentifier: "CartHeaderView")
        tableView.register(UINib(nibName: "CartFooterView", bundle: Bundle(for: self.classForCoder)), forCellReuseIdentifier: "CartFooterView")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func calculatePrice() -> Double {
        var result: Double = 0
        if let items = order?.items {
            for item in items {
                var price: Double = 0
                if let pricePerUnit = item.totalAmount {
                    price = pricePerUnit
                }
                result += price
            }
        }
        return result
    }
    
    func refreshPrice() {
        footerView?.setPrice(price: calculatePrice())
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getCount()
    }
    
    func getCount() -> Int {
        if let items = order?.items {
            return items.count + 2
        }
        return 2
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tryToRemoveItem(indexPath: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let count = getCount()
        if indexPath.row > 0 && indexPath.row < count - 1, let item = order?.items?[indexPath.row - 1] {
            let productVC = PmzProductViewController.init()
            item.orderId = order?.id
            productVC.item = item.copy()
            productVC.store = store
            productVC.editMode = true
            productVC.delegate = self
            PaymentezSDK.shared.pushVC(vc: productVC)
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        if indexPath.row > 0 && indexPath.row < getCount() - 1 {
            
            let delete = UITableViewRowAction(style: .destructive, title: "\u{267A}") { (action, indexPath) in
                self.tryToRemoveItem(indexPath: indexPath)
            }
            delete.backgroundColor = ColorCompat.getRemoveItemBackground()

            return [delete]
        }
        return []
    }
    
    func tryToRemoveItem(indexPath: IndexPath) {
        var message = getString("cart_delete_item_question_closed")
        if let productName = self.order?.items?[indexPath.row - 1].productName {
            message = getString("cart_delete_item_question_opened") + "\(productName)?"
        }
        let alert = UIAlertController(title: getString("cart_delete_item_title"), message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: getString("confirm_button"), style: .default, handler: {(alert: UIAlertAction!) in
            let itemToRemove = self.order!.items![indexPath.row - 1]
            self.removeItem(itemToRemove)
            self.order!.items!.remove(at: indexPath.row - 1)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            self.refreshPrice()
        }))
        alert.addAction(UIAlertAction(title: getString("cancel_button"), style: .cancel, handler: {(alert: UIAlertAction!) in
            self.tableView.reloadData()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func removeItem(_ item: PmzItem) {
        showLoading()
        API.sharedInstance.deleteItem(item: item, callback: { [weak self] (order) in
            guard let self = self else { return }
            self.order = order.mergeData(self.order!)
            self.orderModified = true
            self.dismissPmzLoading()
            self.checkForItems()
            }, failure: { [weak self] (error) in
                guard let self = self else { return }
                self.dismissPmzLoading()
                self.showGenericError()
        })
    }
    
    func onItemAddedToOrder(order: PmzOrder) {
        self.order = order
        tableView.reloadData()
    }
    
    func checkForItems() {
        if order == nil || order!.items == nil || order!.items!.count == 0 {
            showGenericErrorWithCallback(title: getString("error_cart_empty_cart_title"), error: getString("error_cart_empty_cart_message"), action: {(alert: UIAlertAction!) in
                self.backDidPressed(self)
            })
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CartHeaderView") as! CartHeaderView
            cell.configure(store: store)
            cell.delegate = self
            return cell
        }
        if let size = order?.items?.count {
            if indexPath.row - 1 == size {
                return getFooterView()
            }
        } else {
            return getFooterView()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemCellView") as! CartItemCellView
        if let item = order?.items?[indexPath.row - 1] {
            cell.configure(item: item)
        }
        return cell
    }
    
    func getFooterView() -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartFooterView") as! CartFooterView
        cell.initialize()
        cell.setPrice(price: calculatePrice())
        footerView = cell
        return cell
    }
    
    @objc func finishFlow() {
        order?.store = store
        PaymentezSDK.shared.onSearchFinished(order: order!)
    }
    
    @IBAction func backDidPressed(_ sender: Any) {
        if fromReopen {
            goBackToPmzMenu()
            freeMemory()
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func freeMemory() {
        footerView = nil
        store = nil
        order = nil
    }
    
    func goBackToPmzMenu() {
        let menu = PmzMenuViewController.init()
        menu.store = store
        menu.order = order
        menu.fromReopen = true
        self.navigationController?.pushViewController(menu, animated: false)
    }
    
    func onKeepBuyingPressed() {
        backDidPressed(self)
    }
    
    func startSession() {
        showLoading()
        API.sharedInstance.startSession(session: PaymentezSDK.shared.session!, callback: { [weak self] (token) in
            guard let self = self else { return }
            PaymentezSDK.shared.token = token
            self.dismissPmzLoading()
            }, failure: { [weak self] (error) in
                guard let self = self else { return }
                self.dismissPmzLoading()
                self.goBackToHostApp()
        })
    }
}
