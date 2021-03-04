import Foundation

public protocol PmzSearchCallback {
    func searchFinishedSuccessfully(order: PmzOrder)
    func searchFinishedWithError(error: PmzError)
    func searchCancelled()
}

public protocol PmzPayAndPlaceCallback {
    func payAndPlaceFinishedSuccessfully(order: PmzOrder)
    func payAndPlaceOnError(order: PmzOrder?, error: PmzError)
}

public protocol PmzGetStoresCallback {
    func getStoresOnSuccess(stores: [PmzStore])
    func getStoresOnError(error: PmzError)
}

public class PaymentezSDK {
    
    public static let shared: PaymentezSDK = PaymentezSDK()
    var navController: UINavigationController?
    var presentingVC: UIViewController?
    var session: PmzSession?
    var style: PmzStyle?
    var token: String?
    var buyer: PmzBuyer?
    var appOrderReference: String?
    var sdkFontIsShowing: Bool = false
    var hostStatusBarColor: UIColor?
    
    var searchCallback: PmzSearchCallback?
    var paymentCheckerCallback: PmzPayAndPlaceCallback?
    var getStoresCallback: PmzGetStoresCallback?
    
    private init(){}
    
    public func initialize(appCode: String, appKey: String) {
        session = PmzSession(appCode: appCode, appKey: appKey)
        style = PmzStyle()
    }
    
    public func setStyle(style: PmzStyle) -> PaymentezSDK {
        self.style = style
        return self
    }
    
    func getCurrentStatusBarColor() {
        let sharedApplication = UIApplication.shared
        if #available(iOS 13.0, *) {
              hostStatusBarColor = sharedApplication.delegate?.window??.tintColor
          } else {
              guard let statusBarView = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else {
                      return
                  }
              hostStatusBarColor = statusBarView.backgroundColor
        }
    }
    
    func isInitialized() -> Bool {
        if session != nil {
            return true
        } else {
            fatalError("PaymentezSDK: not initialized")
        }
    }
    
    func isBuyerWellInitialized(_ buyer: PmzBuyer) -> Bool {
        if buyer.email != nil && buyer.email! != ""
            && buyer.fiscalNumber != nil && buyer.fiscalNumber! != ""
            && buyer.name != nil && buyer.name! != ""
            && buyer.phone != nil && buyer.phone! != ""
            && buyer.userReference != nil && buyer.userReference! != "" {
            return true
        } else {
            fatalError("PaymentezSDK: PmzBuyer malformed")
        }
    }
    
    func isAppOrderReferenceUsable(_ appOrderReference: String) -> Bool {
        if appOrderReference != "" {
            return true
        } else {
            fatalError("PaymentezSDK: appOrderReference is empty")
        }
    }
    
    private func isOrderUsable(_ order: PmzOrder) -> Bool {
        if order.id != nil && order.store != nil {
            return true
        } else {
            fatalError("PaymentezSDK: PmzOrder malformed")
        }
    }
    
    public func startSearch(navigationController: UINavigationController, buyer: PmzBuyer, appOrderReference: String, callback: PmzSearchCallback, animated: Bool? = true) {
        if isInitialized() && isBuyerWellInitialized(buyer) && isAppOrderReferenceUsable(appOrderReference){
            getCurrentStatusBarColor()
            self.buyer = buyer
            self.appOrderReference = appOrderReference
            searchCallback = callback
            navController = navigationController
            navigationController.isNavigationBarHidden = true
            presentingVC = navigationController.viewControllers.last
            let firstController = PmzStoresViewController.init()
            var animate = true
            if let animated = animated {
                animate = animated
            }
            navigationController.pushViewController(firstController, animated: animate)
        }
    }
    
    public func startSearch(navigationController: UINavigationController, buyer: PmzBuyer, appOrderReference: String, searchStoresFilter: String, callback: PmzSearchCallback, animated: Bool? = true) {
        if isInitialized() && isBuyerWellInitialized(buyer) && isAppOrderReferenceUsable(appOrderReference){
            getCurrentStatusBarColor()
            self.buyer = buyer
            self.appOrderReference = appOrderReference
            searchCallback = callback
            navController = navigationController
            navigationController.isNavigationBarHidden = true
            presentingVC = navigationController.viewControllers.last
            let firstController = PmzStoresViewController.init()
            firstController.filter = searchStoresFilter
            var animate = true
            if let animated = animated {
                animate = animated
            }
            navigationController.pushViewController(firstController, animated: animate)
        }
    }
    
    public func startSearch(navigationController: UINavigationController, buyer: PmzBuyer, appOrderReference: String, storeId: CLong, callback: PmzSearchCallback, animated: Bool? = true) {
        if isInitialized() && isBuyerWellInitialized(buyer) && isAppOrderReferenceUsable(appOrderReference) {
            getCurrentStatusBarColor()
            self.buyer = buyer
            self.appOrderReference = appOrderReference
            searchCallback = callback
            navController = navigationController
            navigationController.isNavigationBarHidden = true
            presentingVC = navigationController.viewControllers.last
            let secondController = PmzMenuViewController.init()
            secondController.storeId = storeId
            var animate = true
            if let animated = animated {
                animate = animated
            }
            navigationController.pushViewController(secondController, animated: animate)
        }
    }
    
    public func reopenOrder(navigationController: UINavigationController, order: PmzOrder, buyer: PmzBuyer, appOrderReference: String, callback: PmzSearchCallback, animated: Bool? = true) {
        if isInitialized() && isBuyerWellInitialized(buyer) && isAppOrderReferenceUsable(appOrderReference) && isOrderUsable(order) {
            getCurrentStatusBarColor()
            self.buyer = buyer
            self.appOrderReference = appOrderReference
            searchCallback = callback
            navController = navigationController
            navigationController.isNavigationBarHidden = true
            presentingVC = navigationController.viewControllers.last
            let cartVC = PmzCartViewController.init()
            cartVC.fromReopen = true
            cartVC.order = order
            cartVC.store = order.store
            var animate = true
            if let animated = animated {
                animate = animated
            }
            navigationController.pushViewController(cartVC, animated: animate)
        }
    }
    
    public func showSummary(navigationController: UINavigationController, order: PmzOrder, callback: PmzSearchCallback, animated: Bool? = true) {
        if(isInitialized()) {
            getCurrentStatusBarColor()
            searchCallback = callback
            navController = navigationController
            navigationController.isNavigationBarHidden = true
            presentingVC = navigationController.viewControllers.last
            let summaryController = PmzSummaryViewController.init()
            summaryController.order = order
            var animate = true
            if let animated = animated {
                animate = animated
            }
            navigationController.pushViewController(summaryController, animated: animate)
        }
    }
    
    public func getStores(filter: String?, callback: PmzGetStoresCallback) {
        if isInitialized() {
            if token != nil {
                doGetStores(filter: filter, callback: callback)
            } else {
                API.sharedInstance.startSession(session: PaymentezSDK.shared.session!, callback: { [weak self] (token) in
                    guard let self = self else { return }
                    PaymentezSDK.shared.token = token
                    self.doGetStores(filter: filter, callback: callback)
                    }, failure: { (error) in
                        callback.getStoresOnError(error: error)
                })
            }
        }
    }
    
    func doGetStores(filter: String?, callback: PmzGetStoresCallback) {
        self.getStoresCallback = callback
        API.sharedInstance.getStores(callback: { (stores) in
            callback.getStoresOnSuccess(stores: stores)
            }, failure: { (error) in
                callback.getStoresOnError(error: error)
        })
    }
    
    public func startPayAndPlace(navigationController: UINavigationController, order: PmzOrder, paymentData: PmzPaymentData, callback: PmzPayAndPlaceCallback, animated: Bool? = true) {
        if isInitialized() {
            getCurrentStatusBarColor()
            paymentCheckerCallback = callback
            let payAndPlace = PmzPayAndPlaceViewController.init()
            payAndPlace.paymentData = paymentData
            startPayPlaceGeneric(navigationController: navigationController, vc: payAndPlace, order: order, animated: animated)
        }
    }
    
    public func startPayAndPlace(navigationController: UINavigationController, order: PmzOrder, paymentData: PmzPaymentData, skipSummary: Bool, callback: PmzPayAndPlaceCallback, animated: Bool? = true) {
        if isInitialized() {
            getCurrentStatusBarColor()
            paymentCheckerCallback = callback
            let payAndPlace = PmzPayAndPlaceViewController.init()
            payAndPlace.paymentData = paymentData
            payAndPlace.skipSummary = skipSummary
            startPayPlaceGeneric(navigationController: navigationController, vc: payAndPlace, order: order, animated: animated)
        }
    }
    
    public func startPayAndPlace(navigationController: UINavigationController, order: PmzOrder, paymentsData: [PmzPaymentData], callback: PmzPayAndPlaceCallback, animated: Bool? = true) {
        if isInitialized() {
            getCurrentStatusBarColor()
            paymentCheckerCallback = callback
            let payAndPlace = PmzPayAndPlaceViewController.init()
            payAndPlace.paymentsData = paymentsData
            startPayPlaceGeneric(navigationController: navigationController, vc: payAndPlace, order: order, animated: animated)
        }
    }
    
    public func startPayAndPlace(navigationController: UINavigationController, order: PmzOrder, paymentsData: [PmzPaymentData], skipSummary: Bool, callback: PmzPayAndPlaceCallback, animated: Bool? = true) {
        if isInitialized() {
            getCurrentStatusBarColor()
            paymentCheckerCallback = callback
            let payAndPlace = PmzPayAndPlaceViewController.init()
            payAndPlace.skipSummary = skipSummary
            payAndPlace.paymentsData = paymentsData
            startPayPlaceGeneric(navigationController: navigationController, vc: payAndPlace, order: order, animated: animated)
        }
    }
    
    func startPayPlaceGeneric(navigationController: UINavigationController, vc: PmzPayAndPlaceViewController, order: PmzOrder, animated: Bool? = true) {
        getCurrentStatusBarColor()
        vc.order = order
        navController = navigationController
        navigationController.isNavigationBarHidden = true
        presentingVC = navigationController.viewControllers.last
        var animate = true
        if let animated = animated {
            animate = animated
        }
        navigationController.pushViewController(vc, animated: animate)
    }
    
    func pushVC(vc: UIViewController) {
        if(navController != nil) {
            navController!.pushViewController(vc, animated: true)
        }
    }
    
    func getBundle() -> Bundle? {
        return Bundle(for: PaymentezSDK.self)
    }
    
    func getString(_ key: String) -> String {
        if let bundle = PaymentezSDK.shared.getBundle() {
            return NSLocalizedString(key, bundle: bundle, comment: "")
        }
        return ""
    }
    
    func onSearchCancelled() {
        goBackToHostApp(freing: false)
        searchCallback?.searchCancelled()
        freeVariables()
        searchCallback = nil
    }
    
    func onSearchFinished(order: PmzOrder) {
        goBackToHostApp(freing: false)
        searchCallback?.searchFinishedSuccessfully(order: order)
        freeVariables()
        searchCallback = nil
    }
    
    func onPaymentCheckingFinished(order: PmzOrder) {
        goBackToHostApp(freing: false)
        paymentCheckerCallback?.payAndPlaceFinishedSuccessfully(order: PmzOrder())
        freeVariables()
        paymentCheckerCallback = nil
    }
    
    func onPaymentCheckingError(order: PmzOrder, error: PmzError) {
        goBackToHostApp(freing: false)
        paymentCheckerCallback?.payAndPlaceOnError(order: order, error: error)
        freeVariables()
        paymentCheckerCallback = nil
    }
    
    private func goBackToHostApp(freing: Bool? = true) {
        UIFont.overrideToDefault()
        if(presentingVC != nil) {
            navController?.popToViewController(presentingVC!, animated: true)
        } else {
            navController?.popToRootViewController(animated: true)
        }
        if let freing = freing, freing {
            freeVariables()
        }
    }
    
    func freeVariables() {
        navController = nil
        presentingVC = nil
        searchCallback = nil
        paymentCheckerCallback = nil
        getStoresCallback = nil
    }
    
    public func goBackWithServiceError() {
        goBackToHostApp()
        if(paymentCheckerCallback != nil) {
            paymentCheckerCallback?.payAndPlaceOnError(order: nil, error: PmzError(PmzError.SERVICE_ERROR))
            paymentCheckerCallback = nil
        }
        if(searchCallback != nil) {
            searchCallback?.searchFinishedWithError(error: PmzError(PmzError.SERVICE_ERROR))
            searchCallback = nil
        }
    }
}
