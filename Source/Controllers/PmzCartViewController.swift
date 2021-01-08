//
//  PmzCartViewController.swift
//  Alamofire
//
//  Created by Fennoma on 16/12/2020.
//

import Foundation

class PmzCartViewController: PaymentezViewController, UITableViewDelegate, UITableViewDataSource, CartHeaderDelegate {
    
    static let PMZ_CART_VC = "PmzCartVC"
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var nextButton: UIView!
    var footerView: CartFooterView?
    
    var store: PmzStore?
    var order: PmzOrder?
    
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
        setTableView()
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
        var message = "¿Seguro que desea borrar el item?"
        if let productName = self.order?.items?[indexPath.row - 1].productName {
            message = "¿Seguro que desea borrar el item \(productName)?"
        }
        let alert = UIAlertController(title: "Borrar item", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Confirmar", style: .default, handler: {(alert: UIAlertAction!) in
            let itemToRemove = self.order!.items![indexPath.row - 1]
            self.removeItem(itemToRemove)
            self.order!.items!.remove(at: indexPath.row - 1)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            self.refreshPrice()
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: {(alert: UIAlertAction!) in
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
            }, failure: { [weak self] (error) in
                guard let self = self else { return }
                self.dismissPmzLoading()
                self.showGenericError()
        })
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CartHeaderView") as! CartHeaderView
            cell.configure(store: store)
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
        self.navigationController?.popViewController(animated: true)
    }
    
    func onKeepBuyingPressed() {
        backDidPressed(self)
    }
}
