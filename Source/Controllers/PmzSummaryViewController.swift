import Foundation

class PmzSummaryViewController: PaymentezViewController, UITableViewDelegate, UITableViewDataSource {
    
    static let PMZ_SUMMARY_VC = "PmzSummaryVC"
       
    @IBOutlet var tableView: UITableView!
    @IBOutlet var nextButton: UIView!
   
    var fromPayment: Bool = false
    
    var store: PmzStore?
    var order: PmzOrder?
   
    init() {
        super.init(nibName: PmzSummaryViewController.PMZ_SUMMARY_VC, bundle: PaymentezSDK.shared.getBundle())
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setColors()
        if let font = PaymentezSDK.shared.style?.getFontString(), font != PmzFontNames.SYSTEM {
            UIFont.overrideInitialize()
        }
        store = order?.store
        nextButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.finishFlow)))
        setTableView()
    }
   
    func setTableView() {
        tableView.register(UINib(nibName: "CartItemCellView", bundle: Bundle(for: self.classForCoder)), forCellReuseIdentifier: "CartItemCellView")
        tableView.register(UINib(nibName: "SummaryFooterView", bundle: Bundle(for: self.classForCoder)), forCellReuseIdentifier: "SummaryFooterView")
        tableView.register(UINib(nibName: "SummaryHeaderView", bundle: Bundle(for: self.classForCoder)), forCellReuseIdentifier: "SummaryHeaderView")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 404
    }
    
    func setColors() {
        if let buttonColor = PaymentezSDK.shared.style?.buttonBackgroundColor {
            changeStatusBarColor(color: buttonColor)
        }
    }
   
    func calculatePrice() -> Double {
        var result: Double = 0
        if let items = order?.items {
            for item in items {
                var amount: Double = 1
                if let realAmount = item.quantity {
                    amount = Double(realAmount)
                }
                var priceToMultiply: Double = 0
                if let pricePerUnit = item.totalAmount {
                    priceToMultiply = pricePerUnit
                }
                result += priceToMultiply * amount
            }
        }
        return result
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let items = order?.items {
            return items.count + 2
        }
        return 2
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SummaryHeaderView") as! SummaryHeaderView
            cell.configure(store: store)
            return cell
        }
        if let count = order?.items?.count {
            if indexPath.row - 1 == count {
                return getFooterCell()
            }
        } else {
            return getFooterCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemCellView") as! CartItemCellView
        if let item = order?.items?[indexPath.row - 1] {
            cell.configure(item: item)
        }
        return cell
    }
    
    func getFooterCell() -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SummaryFooterView") as! SummaryFooterView
        cell.initialize()
        cell.setPrice(price: calculatePrice())
        return cell
    }
   
    @objc func finishFlow() {
        if fromPayment {
            PaymentezSDK.shared.onPaymentCheckingFinished(order: order!)
        } else {
            PaymentezSDK.shared.onSearchFinished(order: order!)
        }
    }
   
    @IBAction func backDidPressed(_ sender: Any) {
        PaymentezSDK.shared.onSearchCancelled()
    }
}
