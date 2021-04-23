import Foundation
import XLPagerTabStrip

class PmzMenuViewController: BaseButtonBarPagerTabStripViewController<CustomTabItemCollectionViewCell>, PmzMenuFragmentDelegate, PmzProductVCDelegate, UISearchBarDelegate, CLLocationListener {
    
    static let PMZ_MENU_VC = "PmzMenuVC"

    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var storeTitle: UILabel!
    @IBOutlet weak var storeSubtitle: UILabel!
    @IBOutlet weak var storeDistance: UILabel!
    @IBOutlet weak var storeLogo: UIImageView!
    
    @IBOutlet var headerContainer: UIView!
    @IBOutlet var footerContainer: UIView!
    @IBOutlet weak var nextButton: UIView!
    @IBOutlet weak var container: UIScrollView!
    @IBOutlet weak var headerBar: UIView!
    @IBOutlet weak var nextButtonBackground: UIView!
    @IBOutlet weak var nextButtonText: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var headerTitle: UILabel!
    
    @IBOutlet weak var magnifyButton: UIButton!
    @IBOutlet weak var cartButton: UIButton!
    @IBOutlet weak var searchBarBackground: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var storeId: CLong?
    weak var store: PmzStore?
    var menu: PmzMenu?
    var order: PmzOrder?
    
    var filteredCategories: [PmzCategory]?
    
    var fromReopen: Bool = false
    var forcedId: Bool = false
    
    var vcs: [PmzMenuFragmentVC]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LocationManager.sharedInstance.startIfNotStarted()
        if let font = PaymentezSDK.shared.style?.getFontString(), font != PmzFontNames.SYSTEM {
            UIFont.overrideInitialize()
        }
        setPropperColors()
        nextButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.goToCart)))
        
        changeCurrentIndexProgressive = { (oldCell: CustomTabItemCollectionViewCell?, newCell: CustomTabItemCollectionViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }

            if let textColor = PaymentezSDK.shared.style?.textColor {
                oldCell?.label.textColor = textColor.withAlphaComponent(0.6)
                newCell?.label.textColor = textColor
            }
        }
        setSearchBar()
        
        if let store = store {
            self.storeId = store.id!
            getMenu(storeId: store.id!)
            setStoreData()
        } else if storeId != nil {
            forcedId = true
            startSession()
        } else {
            goBackToHostApp(getString("menu_couldnt_load_message"))
        }
    }
    
    func checkForLocation() {
        if(!LocationManager.sharedInstance.isLocationEnabled()) {
            LocationManager.sharedInstance.locationListener = self
            LocationManager.sharedInstance.requestWhenInUseAuthorization()
        } else {
            LocationManager.sharedInstance.startIfNotStarted()
        }
    }
    
    func locationGranted() {
        LocationManager.sharedInstance.removeListener()
        setStoreData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        LocationManager.sharedInstance.stopIfStarted()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
         return .lightContent
    }
    
    init() {
        super.init(nibName: PmzMenuViewController.PMZ_MENU_VC, bundle: PaymentezSDK.shared.getBundle())
        buttonBarItemSpec = ButtonBarItemSpec.nibFile(nibName: "VirtualCardTabView",
                                                      bundle: PaymentezSDK.shared.getBundle(),
                                                      width: { info in
                    let font = UIFont.boldSystemFont(ofSize: 14)
                    if let title = info.title {
                        let fontAttributes = [NSAttributedString.Key.font: font]
                        let value = (title as NSString).size(withAttributes: fontAttributes).width + 20
                        return value
                    } else {
                        return 140
                    }
        })
        var color = UIColor.white
        if let backgroundColor = PaymentezSDK.shared.style?.backgroundColor {
            color = backgroundColor
        }
        settings.style.buttonBarBackgroundColor = color
        settings.style.buttonBarItemBackgroundColor = color
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        settings.style.selectedBarHeight = 2
        settings.style.buttonBarHeight = 2
        
        if let barColor = PaymentezSDK.shared.style?.buttonBackgroundColor {
            settings.style.selectedBarBackgroundColor = barColor
            settings.style.buttonBarItemBackgroundColor = barColor
        }
    }
    
    func getFilter() -> String {
        if let filter = searchBar.text {
            return filter
        }
        return ""
    }
    
    func setSearchBar() {
        searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        refreshFilter(filter: searchText)
    }
    
    func setPropperColors() {
        searchBar.backgroundImage = UIImage()
        if let buttonTextColor = PaymentezSDK.shared.style?.buttonTextColor {
            nextButtonText?.textColor = buttonTextColor
        }
        if let backgroundColor = PaymentezSDK.shared.style?.backgroundColor {
            headerContainer.backgroundColor = backgroundColor
            footerContainer.backgroundColor = backgroundColor
        }
        if let headerBackgroundColor = PaymentezSDK.shared.style?.headerBackgroundColor {
            headerBar?.backgroundColor = headerBackgroundColor
            changeStatusBarColor(color: headerBackgroundColor)
            searchBar.backgroundColor = headerBackgroundColor
        }
        if let headerTextColor = PaymentezSDK.shared.style?.headerTextColor {
            headerTitle?.textColor = headerTextColor
            backButton?.imageView?.tintColor = headerTextColor
            headerTitle?.textColor = headerTextColor
            magnifyButton.tintColor = headerTextColor
            cartButton.tintColor = headerTextColor
        
            if let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField {
                textFieldInsideSearchBar.textColor = headerTextColor
                if let glassIconView = textFieldInsideSearchBar.leftView as? UIImageView {
                        glassIconView.image = glassIconView.image?.withRenderingMode(.alwaysTemplate)
                        glassIconView.tintColor = headerTextColor
                }
                if let clearButton = textFieldInsideSearchBar.value(forKey: "_clearButton")as? UIButton {
                    clearButton.isHidden = true
                }
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure(cell: CustomTabItemCollectionViewCell, for indicatorInfo: IndicatorInfo) {
        cell.label.text = indicatorInfo.title?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        if(vcs != nil) {
            return vcs!
        }
        return [PmzMenuFragmentVC()]
    }
    
    func setStoreData() {
        if let store = self.store {
            PmzImageUtils.loadImage(store.imageUrl, imageView: headerImage)
            PmzImageUtils.loadImage(store.commerceImage, imageView: storeLogo)
            
            storeLogo.layer.borderWidth = 0
            storeLogo.layer.borderColor = UIColor.white.cgColor
            
            storeTitle.text = store.name
            storeSubtitle.text = store.commerceName
            
            if let style = PaymentezSDK.shared.style, let textColor = style.textColor {
                storeTitle.textColor = textColor
                storeSubtitle.textColor = textColor
                storeDistance.textColor = textColor
            }
            if let location = store.location,
                let lastKnownLocation = LocationManager.sharedInstance.lastKnownLocation {
                let distanceString = DistanceHelper.stringForMeters(meters: (lastKnownLocation.distance(from: location)))
                storeDistance!.text = distanceString
            } else {
                storeDistance!.text = "-"
            }
        }
    }
    
    @objc func goToCart() {
        if let items = order?.items, items.count > 0 {
            let vc = PmzCartViewController.init()
            vc.order = order
            vc.store = store
            PaymentezSDK.shared.pushVC(vc: vc)
        }
    }
    
    func showError(_ error: String?) {
        var errorToShow = getString("error_generic_error")
        if let error = error {
            errorToShow = error
        }
        let alert = UIAlertController(title: getString("error_title"), message: errorToShow, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: getString("accept_button"), style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func itemSelected(_ product: PmzProduct) {
        let vc = PmzProductViewController.init()
        vc.order = order
        vc.store = store
        if let orderId = order?.id {
            vc.orderId = orderId
        }
        vc.product = product
        vc.delegate = self
        PaymentezSDK.shared.pushVC(vc: vc)
    }
    
    func onItemAddedToOrder(order: PmzOrder) {
        self.order = order
    }
    
    @IBAction func backDidPressed(_ sender: Any) {
        if searchBar.isHidden {
            if forcedId || fromReopen {
                PaymentezSDK.shared.onSearchCancelled()
            } else {
                self.navigationController?.popViewController(animated: true)
            }
        } else {
            searchBar.text = ""
            refreshFilter(filter: "")
            searchBarBackground.isHidden = true
            searchBar.isHidden = true
        }
    }
    
    func startSession() {
        showLoading()
        API.sharedInstance.startSession(session: PaymentezSDK.shared.session!, callback: { [weak self] (token) in
            guard let self = self else { return }
            PaymentezSDK.shared.token = token
            self.getStore()
            }, failure: { [weak self] (error) in
                guard let self = self else { return }
                self.dismissPmzLoading()
                self.goBackToHostApp()
        })
    }
    
    func getStore() {
        API.sharedInstance.getStores(callback: { [weak self] (stores) in
            guard let self = self else { return }
            self.dismissPmzLoading()
            self.findStore(stores: stores)
            self.setStoreData()
            self.getMenu(storeId: self.storeId!)
            }, failure: { [weak self] (error) in
                guard let self = self else { return }
                self.dismissPmzLoading()
                self.goBackToHostApp()
        })
    }
    
    func findStore(stores: [PmzStore]) {
        for store in stores {
            if let storeId = store.id, storeId == self.storeId! {
                self.store = store
            }
        }
    }
    
    func getMenu(storeId: CLong) {
        if !forcedId {
            showLoading()
        }
        API.sharedInstance.getMenu(storeId: storeId, callback: { [weak self] (menu) in
            guard let self = self else { return }
            self.menu = menu
            self.initFragments()
            self.dismissPmzLoading()
            }, failure: { [weak self] (error) in
                guard let self = self else { return }
                self.dismissPmzLoading()
                self.backDidPressed(self)
        })
    }
    
    func refreshFilter(filter: String) {
        if vcs != nil {
            for vc in vcs! {
                vc.refreshFilter(filter)
            }
        }
    }
    
    func initFragments() {
        vcs = [PmzMenuFragmentVC]()
        if let categories = menu?.categories {
            for category in categories {
                let vc = PmzMenuFragmentVC.init()
                vc.delegate = self
                vc.category = category
                vcs!.append(vc)
            }
            reloadPagerTabStripView()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkForLocation()
        if let items = order?.items, items.count > 0 {
            if let buttonColor = PaymentezSDK.shared.style?.buttonBackgroundColor {
                nextButtonBackground?.backgroundColor = buttonColor
            } else {
                nextButtonBackground?.backgroundColor = ColorCompat.getOrange()
            }
        } else {
            nextButtonBackground?.backgroundColor = ColorCompat.getDisabledButtonColor()
        }
    }
    
    @IBAction func searchPressed(_ sender: Any) {
        searchBar.isHidden = false
        searchBarBackground.isHidden = false
    }
    
    @IBAction func cartMenuPressed(_ sender: Any) {
        if let items = order?.items, items.count > 0 {
            goToCart()
        } else {
            showError(getString("error_menu_empty_cart"))
        }
    }
    
    func goBackToHostApp(_ error: String? = nil) {
        var errorToShow = getString("error_generic_error")
        if let error = error {
            errorToShow = error
        }
        let alert = UIAlertController(title: getString("error_title"), message: errorToShow, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: getString("continue_button"), style: .default, handler: {(alert: UIAlertAction!) in
            PaymentezSDK.shared.goBackWithServiceError()
        }))
        present(alert, animated: true, completion: nil)
    }
}
