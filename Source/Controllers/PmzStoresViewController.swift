import Foundation
import UIKit

class PmzStoresViewController: PaymentezViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, CLLocationListener {
    
    static let PMZ_STORES_VC = "PmzStoresVC"
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var magnifyingButton: UIButton!
    @IBOutlet weak var searchBarBackground: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nextButton: UIView!
    
    var filter: String = ""
    var stores: [PmzStore]?
    var filteredStores: [PmzStore]?
    weak var menu: PmzMenu?
    
    init() {
        super.init(nibName: PmzStoresViewController.PMZ_STORES_VC, bundle: PaymentezSDK.shared.getBundle())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let font = PaymentezSDK.shared.style?.getFontString(), font != PmzFontNames.SYSTEM {
            UIFont.overrideInitialize()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "StoreCellView", bundle: Bundle(for: self.classForCoder)), forCellReuseIdentifier: "StoreCellView")
        setSearchBar()
        setColors()
        startSession()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkForLocation()
    }
    
    func checkForLocation() {
        /*if(!LocationManager.sharedInstance.isLocationEnabled()) {
            LocationManager.sharedInstance.locationListener = self
            LocationManager.sharedInstance.requestWhenInUseAuthorization()
        } else {
            LocationManager.sharedInstance.startIfNotStarted()
        }*/
    }
    
    func locationGranted() {
        //LocationManager.sharedInstance.removeListener()
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //LocationManager.sharedInstance.stopIfStarted()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSearchBar() {
        searchBar.delegate = self
        if filter != "" {
            searchBar.text = filter
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        refreshFilter(searchText)
    }
    
    func setColors() {
        searchBar.backgroundImage = UIImage()
        if let buttonColor = PaymentezSDK.shared.style?.buttonBackgroundColor {
            changeStatusBarColor(color: buttonColor)
            searchBar.backgroundColor = buttonColor
        }
        if let textColor = PaymentezSDK.shared.style?.buttonTextColor {
            magnifyingButton.tintColor = textColor
            if let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField {
                textFieldInsideSearchBar.textColor = textColor
                if let glassIconView = textFieldInsideSearchBar.leftView as? UIImageView {
                        glassIconView.image = glassIconView.image?.withRenderingMode(.alwaysTemplate)
                        glassIconView.tintColor = textColor
                }
            }
        }
        if let backgroundColor = PaymentezSDK.shared.style?.backgroundColor {
            tableView.backgroundColor = backgroundColor
        }
    }
    
    @IBAction func backDidPressed(_ sender: Any) {
        if searchBar.isHidden {
            chnageStatusBarToOriginal()
            PaymentezSDK.shared.onSearchCancelled()
            freeMemory()
        } else {
            searchBar.text = ""
            refreshFilter("")
            searchBarBackground.isHidden = true
            searchBar.isHidden = true
        }
    }
    
    func freeMemory() {
        stores = nil
        filteredStores = nil
        menu = nil
        tableView = nil
    }
    
    func refreshFilter(_ filter: String) {
        self.filter = filter
        doFilter(filter)
        tableView.reloadData()
    }
    
    func doFilter(_ filter: String) {
        filteredStores = [PmzStore]()
        if let stores = stores {
            for store in stores {
                if let storeName = store.name {
                    let loweredName = storeName.lowercased()
                    if filter == "" || loweredName.contains(filter.lowercased()) {
                        filteredStores?.append(store)
                    }
                }
            }
        }
    }
    
    func startSession() {
        showLoading()
        API.sharedInstance.startSession(session: PaymentezSDK.shared.session!, callback: { [weak self] (token) in
            guard let self = self else { return }
            PaymentezSDK.shared.token = token
            self.getStores()
            }, failure: { [weak self] (error) in
                guard let self = self else { return }
                self.dismissPmzLoading()
                self.goBackToHostApp()
        })
    }
    
    func getStores() {
        API.sharedInstance.getStores(callback: { [weak self] (stores) in
            guard let self = self else { return }
            self.dismissPmzLoading()
            self.stores = stores
            self.doFilter(self.filter)
            self.tableView.reloadData()
            }, failure: { [weak self] (error) in
                guard let self = self else { return }
                self.dismissPmzLoading()
                self.goBackToHostApp()
        })
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredStores != nil ? filteredStores!.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreCellView") as! StoreCellView
        cell.configure(store: filteredStores![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if let storeSelected = filteredStores?[indexPath.row] {
            itemSelected(storeSelected)
        }
    }
    
    func itemSelected(_ store: PmzStore) {
        let secondController = PmzMenuViewController.init()
        secondController.store = store
        PaymentezSDK.shared.pushVC(vc: secondController)
    }
    
    @IBAction func onSearchPressed(_ sender: Any) {
        searchBar.isHidden = false
        searchBarBackground.isHidden = false
    }
}
