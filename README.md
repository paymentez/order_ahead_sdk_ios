# order_ahead_sdk_ios

## Add SDK to project

https://medium.com/@soufianerafik/how-to-add-pods-to-an-xcode-project-2994aa2abbf1

<img width="372" alt="Captura de Pantalla 2022-03-16 a la(s) 1 56 11 p m" src="https://user-images.githubusercontent.com/67014146/158679036-37b9bf4c-af68-4d8b-a807-dbdccca247ff.png">

###Integration

<img width="1049" alt="image" src="https://user-images.githubusercontent.com/67014146/158679385-8b4319df-993f-40ae-a16c-8d6eff2ebeee.png">

###Available actions

    
    @objc func goToSearch() { 
           PaymentezSDK.shared .setStyle(style: getStyle()) .startSearch(navigationController: navigationController!, buyer: getBuyer(),          appOrderReference: "appOrderReference", callback: self, animated: false) }
    
    @objc func goToSearchWithId() {
        PaymentezSDK.shared
                .setStyle(style: getStyle())
                .startSearch(navigationController: navigationController!, buyer: getBuyer(), appOrderReference: "appOrderReference", storeId: 2, callback: self)
    }
    
    @objc func goToReopenOrder() {
        var order = PmzOrder.hardcoded()
        if previousOrder != nil {
            order = previousOrder!
        }
        
        PaymentezSDK.shared
                .setStyle(style: getStyle())
                .reopenOrder(navigationController: navigationController!, order: order, buyer: getBuyer(), appOrderReference: "appOrderReference", callback: self)
    }
    
    @objc func goToSummary() {
        PaymentezSDK.shared
                .setStyle(style: getStyle())
                .showSummary(navigationController: navigationController!, order: PmzOrder.hardcoded(), callback: self)
    }
    
    @objc func goToPayment() {
        PaymentezSDK.shared
                .setStyle(style: getStyle())
                .startPayAndPlace(navigationController: navigationController!, order: PmzOrder.hardcoded(), paymentsData: PmzPaymentData.hardcodedList(), callback: self)
        //performSegue(withIdentifier: "showTest", sender: self)
    }
    
    func getStyle() -> PmzStyle {
        return PmzStyle().setBackgroundColor(backgroundColorSelected!.color!)
            .setTextColor(textColorSelected!.color!)
            .setButtonBackgroundColor(buttonColorSelected!.color!)
            .setButtonTextColor(buttonTextColorSelected!.color!)
            .setOriginalStatusBarColor(UIColor.white)
            .setHeaderBackgroundColor(UIColor.green)
            .setHeaderTextColor(UIColor.gray)
            .setFont(PmzFont.SYSTEM)
    }
    
    func getBuyer() -> PmzBuyer {
        return PmzBuyer().setName("Pepe").setPhone("123123123").setFiscalNumber("fiscalNumber")
            .setUserReference("userReference").setEmail("pepe@test.com.ar")
    }
    
    func searchFinishedSuccessfully(order: PmzOrder) {
        previousOrder = order
        showToast(controller: self, message: "Flujo terminado exitosamente.", seconds: 1)
    }
    
    func searchCancelled() {
        showToast(controller: self, message: "Flujo cancelado.", seconds: 1)
    }
    
    func payAndPlaceFinishedSuccessfully(order: PmzOrder) {
        showToast(controller: self, message: "Flujo terminado exitosamente.", seconds: 1)
    }
    
    func payAndPlaceOnError(order: PmzOrder, error: PmzError) {
        if let error = error.errorCode {
            switch error {
            case PmzError.PAYMENT_ERROR_KEY:
                showToast(controller: self, message: "Ocurrió un error con el Pago de la orden", seconds: 2)
            case PmzError.PLACE_ERROR_KEY:
                showToast(controller: self, message: "Ocurrió un error con el Place de la orden", seconds: 2)
            default:
                showToast(controller: self, message: "Ocurrió un error inesperado", seconds: 2)
            }
        }
    }
    
    @objc func getStores() {
        showLoading()
        PaymentezSDK.shared.getStores(filter: nil, callback: self)
    }
    
    func getStoresOnSuccess(stores: [PmzStore]) {
        dismissLoading()
        showToast(controller: self, message: "Se obtuvieron los comercios.", seconds: 1)
    }
    
    func getStoresOnError(error: PmzError) {
        dismissLoading()
        showToast(controller: self, message: "Ha ocurrido un error obteniendo los comercios.", seconds: 1)
    }
    
    func searchFinishedWithError(error: PmzError) {
        showToast(controller: self, message: "Ha ocurrido un error con los servicios.", seconds: 1)
    }
    
    func payAndPlaceOnError(order: PmzOrder?, error: PmzError) {
        showToast(controller: self, message: "Ha ocurrido un error con los servicios.", seconds: 1)
    }

