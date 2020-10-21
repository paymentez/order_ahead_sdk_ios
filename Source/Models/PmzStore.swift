//
//  PmzStore.swift
//  PaymentezSDK
//
//  Created by Fennoma on 07/10/2020.
//

import Foundation

public class PmzStore {
    
    public var id: CLong?
    public var commerceId: CLong?
    public var name: String?
    public var address: String?
    public var latitude: Double?
    public var longitude: Double?
    public var country: String?
    public var city: String?
    public var website: String?
    public var phone: String?
    public var imageUrl: String?
    public var enablePayAtTheTableOrders: Bool?
    public var type: Int?
    public var commerceImage: String?
    public var commerceFiscalNumber: Int?
    public var subsidiaryId: CLong?
    public var zipCode: String?
    public var companyName: String?
    public var status: Int?
    public var commercePaymentezAppCode: String?
    public var internalName: String?
    public var commerceName: String?
    public var showStock: Bool?
    public var print: String?
    public var menuId: CLong?
    public var deliveryPrice: CLong?
    public var maxDeliveryDistance: Int?
    public var acceptsDelivery: Bool?
    public var timePreparing: Int?
    public var extraPaymentCodes: [String]?
    public var serverAppCode: String?
    public var clientAppCode: String?
    public var sponsor: PmzSponsor?
    
    init(){}
    
    init(dictionary: [String: Any]) {
        if let id = dictionary["id"] as? CLong {
            self.id = id
        }
        if let commerceId = dictionary["commerce_id"] as? CLong {
            self.commerceId = commerceId
        }
        if let name = dictionary["name"] as? String {
            self.name = name
        }
        if let address = dictionary["address"] as? String {
            self.address = address
        }
        if let latitude = dictionary["lat"] as? Double {
            self.latitude = latitude
        }
        if let longitude = dictionary["lon"] as? Double {
            self.longitude = longitude
        }
        if let country = dictionary["country"] as? String {
            self.country = country
        }
        if let city = dictionary["city"] as? String {
            self.city = city
        }
        if let website = dictionary["website"] as? String {
            self.website = website
        }
        if let phone = dictionary["phone"] as? String {
            self.phone = phone
        }
        if let imageUrl = dictionary["image"] as? String {
            self.imageUrl = imageUrl
        }
        if let enablePayAtTheTableOrders = dictionary["enable_pay_at_the_table_orders"] as? Bool {
            self.enablePayAtTheTableOrders = enablePayAtTheTableOrders
        }
        if let type = dictionary["type"] as? Int {
            self.type = type
        }
        if let commerceImage = dictionary["commerce_image"] as? String {
            self.commerceImage = commerceImage
        }
        if let commerceFiscalNumber = dictionary["commerce_fiscal_number"] as? Int {
            self.commerceFiscalNumber = commerceFiscalNumber
        }
        if let subsidiaryId = dictionary["subsidiary_id"] as? CLong {
            self.subsidiaryId = subsidiaryId
        }
        if let zipCode = dictionary["zip_code"] as? String {
            self.zipCode = zipCode
        }
        if let companyName = dictionary["company_name"] as? String {
            self.companyName = companyName
        }
        if let status = dictionary["status"] as? Int {
            self.status = status
        }
        if let commercePaymentezAppCode = dictionary["commerce_paymentez_app_code"] as? String {
            self.commercePaymentezAppCode = commercePaymentezAppCode
        }
        if let internalName = dictionary["internal_name"] as? String {
            self.internalName = internalName
        }
        if let commerceName = dictionary["commerce_name"] as? String {
            self.commerceName = commerceName
        }
        if let showStock = dictionary["show_stock"] as? Bool {
            self.showStock = showStock
        }
        if let print = dictionary["print"] as? String {
            self.print = print
        }
        if let menuId = dictionary["menu_id"] as? CLong {
            self.menuId = menuId
        }
        if let deliveryPrice = dictionary["delivery_price"] as? CLong {
            self.deliveryPrice = deliveryPrice
        }
        if let maxDeliveryDistance = dictionary["max_delivery_distance"] as? Int {
            self.maxDeliveryDistance = maxDeliveryDistance
        }
        if let acceptsDelivery = dictionary["accept_delivery"] as? Bool {
            self.acceptsDelivery = acceptsDelivery
        }
        if let timePreparing = dictionary["time_preparing"] as? Int {
            self.timePreparing = timePreparing
        }
        if let serverAppCode = dictionary["server_app_code"] as? String {
            self.serverAppCode = serverAppCode
        }
        if let clientAppCode = dictionary["clien_app_code"] as? String {
            self.clientAppCode = clientAppCode
        }
        if let sponsor = dictionary["sponsor"] as? [String: Any] {
            self.sponsor = PmzSponsor(dictionary: sponsor)
        }
    }
    
    public static func hardcoded() -> [PmzStore] {
        if let dic = convertStringToDictionary(text: PmzStore.json) {
            return dic.compactMap({
                PmzStore(dictionary: $0 as! [String: Any])
            })
        } else {
            return [PmzStore]()
        }
    }
    
    static func convertStringToDictionary (text:String) -> NSArray? {
        do {
            let data: Data = text.data(using: String.Encoding.utf8)!
            return try JSONSerialization.jsonObject(with: data, options: []) as? NSArray
        } catch _ {
            return nil
        }
    }
    
    static let json: String = "[\n" +
    "  {\n" +
    "    \"id\": 97,\n" +
    "    \"name\": \"Spoleto Centro Chia\",\n" +
    "    \"address\": \"Avenida Pradilla 900 Este local 51\",\n" +
    "    \"lat\": 4.8471644,\n" +
    "    \"lon\": -74.0784931,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Chía\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Logos/generic-qr.png\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 8,\n" +
    "    \"commerce_image\": \"https://middleware-paymentez.s3.amazonaws.com/Menus/Logos/spoleto.jpg\",\n" +
    "    \"commerce_id\": 51,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": null,\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": null,\n" +
    "    \"commerce_name\": \"Spoleto\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 56,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 20,\n" +
    "    \"extra_payments_codes\": [],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": null\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 99,\n" +
    "    \"name\": \"Elliniká - CC Plaza Claro\",\n" +
    "    \"address\": \"CE 68a 24b 10 , local 2 - 10\",\n" +
    "    \"lat\": 4.6511133,\n" +
    "    \"lon\": -74.1060759,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Bogotá\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.amazonaws.com/Menus/Productos/Ellinika/Logo%20Ellinikae%CC%8C.jpg\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 8,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.amazonaws.com/Menus/Productos/Ellinika/Logo%20Ellinikae%CC%8C.jpg\",\n" +
    "    \"commerce_id\": 53,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": null,\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": null,\n" +
    "    \"commerce_name\": \"Elliniká\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 58,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 20,\n" +
    "    \"extra_payments_codes\": [],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": null\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 100,\n" +
    "    \"name\": \"Empanadas La Casona Torre Colpatria\",\n" +
    "    \"address\": \"Cra 9 #24 -50\",\n" +
    "    \"lat\": 4.6107532,\n" +
    "    \"lon\": -74.070594,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Bogotá\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Logos/generic-qr.png\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 9,\n" +
    "    \"commerce_image\": \"https://middleware-paymentez.s3.amazonaws.com/Menus/Logos/empanadas%20la%20casona.jpeg\",\n" +
    "    \"commerce_id\": 54,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"Empanadas La Casona\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": null,\n" +
    "    \"commerce_name\": \"Empanadas La Casona\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 59,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 20,\n" +
    "    \"extra_payments_codes\": [\n" +
    "      {\n" +
    "        \"method_reference\": \"DEBIT\",\n" +
    "        \"description\": \"Terminal en mesa\"\n" +
    "      },\n" +
    "      {\n" +
    "        \"method_reference\": \"MEMBER\",\n" +
    "        \"description\": \"Membresia\"\n" +
    "      }\n" +
    "    ],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"QR a la Mesa - Redeban\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/8c0a366e8d8db6d0a24a77a5f2ed8d61.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/4bf30d0f41582e210c4bf69173a70c61.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/078a544e3ec019962990743c042a5f39.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/ed204d5c862299cf627e6e6503a1cb1b.jpeg\",\n" +
    "      \"color\": \"#0033A1\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0a6d24b99f2cb67c2c67785f921b34d7.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/82046f0a68e46f9471b95a44124fd997.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0858dd8d89e28f85b4a8c3a1bb1e9765.jpeg\"\n" +
    "    }\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 101,\n" +
    "    \"name\": \"Avena Cubana\",\n" +
    "    \"address\": \"Calle 63a #70-16, Bogotá\",\n" +
    "    \"lat\": 4.6718821,\n" +
    "    \"lon\": -74.1002834,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Bogotá\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.amazonaws.com/Menus/Logos/Logo%20Avena%20Cubana.jpg\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 8,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.amazonaws.com/Menus/Logos/Logo%20Avena%20Cubana.jpg\",\n" +
    "    \"commerce_id\": 55,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"Avena Cubana\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": null,\n" +
    "    \"commerce_name\": \"Avena Cubana\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 60,\n" +
    "    \"delivery_price\": 100,\n" +
    "    \"max_delivery_distance\": 1000,\n" +
    "    \"accept_delivery\": true,\n" +
    "    \"time_preparing\": 15,\n" +
    "    \"extra_payments_codes\": [],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": null\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 102,\n" +
    "    \"name\": \"Don Jediondo Santafé Medellín\",\n" +
    "    \"address\": \"Cra. 43 A No. 7 SUR – 170  Local 4011\",\n" +
    "    \"lat\": 6.1962584,\n" +
    "    \"lon\": -75.574054,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Medellín\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Logos/generic-qr.png\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 9,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.amazonaws.com/Menus/Productos/Don%20Jediondo/Logo-Don-Jediondo.jpg\",\n" +
    "    \"commerce_id\": 56,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": null,\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": null,\n" +
    "    \"commerce_name\": \"Don Jediondo\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 61,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 20,\n" +
    "    \"extra_payments_codes\": [],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": null\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 103,\n" +
    "    \"name\": \"Momotea Arkadia\",\n" +
    "    \"address\": \"C.C. Arkadia - Carrera 70 # 1-141 - Local K1-11\",\n" +
    "    \"lat\": 6.2124314,\n" +
    "    \"lon\": -75.5946188,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Medellín\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.amazonaws.com/Menus/Logos/Momotea.jpg\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 8,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.amazonaws.com/Menus/Logos/Momotea.jpg\",\n" +
    "    \"commerce_id\": 57,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"Momotea\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": null,\n" +
    "    \"commerce_name\": \"Momotea\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 69,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 20,\n" +
    "    \"extra_payments_codes\": [],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": null\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 105,\n" +
    "    \"name\": \"Poke Usáquen\",\n" +
    "    \"address\": \"Cl. 120a #5-61\",\n" +
    "    \"lat\": 4.6963352,\n" +
    "    \"lon\": -74.0291562,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Bogotá\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.amazonaws.com/Menus/Logos/poke.jpg\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 8,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.amazonaws.com/Menus/Logos/poke.jpg\",\n" +
    "    \"commerce_id\": 59,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"Poke\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": \"\",\n" +
    "    \"commerce_name\": \"Poke\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 64,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 15,\n" +
    "    \"extra_payments_codes\": [],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"QR-Mastercard\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/ced7df70049391bde97fe84e04851730.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/76e2061f936ee2b2d64de564c3edbc52.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/9030a6f816467bd181367adb77d5219e.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/c1d9fc88ea3cd501c98301ae3335ee61.jpeg\",\n" +
    "      \"color\": \"#000000\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/785040ea4452df7fe62f88a6df7cbb5a.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/a6db91963773c2a80c386d5726fefdef.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0f9d5d7540e00036afa61c9745773e83.jpeg\"\n" +
    "    }\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 106,\n" +
    "    \"name\": \"Empanaditas de Pipian City U\",\n" +
    "    \"address\": \"Cl. 19 #2a - 10\",\n" +
    "    \"lat\": 4.6032112,\n" +
    "    \"lon\": -74.0673722,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Bogotá\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.amazonaws.com/Menus/Logos/empanaditas%20de%20pipian.png\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 9,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.amazonaws.com/Menus/Logos/empanaditas%20de%20pipian.png\",\n" +
    "    \"commerce_id\": 60,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": null,\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": null,\n" +
    "    \"commerce_name\": \"Empanaditas De Pipian\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 65,\n" +
    "    \"delivery_price\": 100,\n" +
    "    \"max_delivery_distance\": 1000,\n" +
    "    \"accept_delivery\": true,\n" +
    "    \"time_preparing\": 15,\n" +
    "    \"extra_payments_codes\": [],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": null\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 107,\n" +
    "    \"name\": \"Frutos del Bosque CC. Santa Fé\",\n" +
    "    \"address\": \"Calle 185 # 45- 03 Local 30005 A\",\n" +
    "    \"lat\": 4.762714,\n" +
    "    \"lon\": -74.0462119,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Bogotá\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.amazonaws.com/Menus/Logos/frutos%20del%20bosque.png\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 8,\n" +
    "    \"commerce_image\": \"https://middleware-paymentez.s3.amazonaws.com/Menus/Logos/frutos%20del%20bosque.png\",\n" +
    "    \"commerce_id\": 61,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"Frutos Del Bosque\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": null,\n" +
    "    \"commerce_name\": \"Frutos Del Bosque\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 66,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 20,\n" +
    "    \"extra_payments_codes\": [],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"QR a la Mesa - Redeban\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/8c0a366e8d8db6d0a24a77a5f2ed8d61.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/4bf30d0f41582e210c4bf69173a70c61.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/078a544e3ec019962990743c042a5f39.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/ed204d5c862299cf627e6e6503a1cb1b.jpeg\",\n" +
    "      \"color\": \"#0033A1\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0a6d24b99f2cb67c2c67785f921b34d7.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/82046f0a68e46f9471b95a44124fd997.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0858dd8d89e28f85b4a8c3a1bb1e9765.jpeg\"\n" +
    "    }\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 108,\n" +
    "    \"name\": \"P.F. Chang's Santa Barbara - 30 Min Aprox\",\n" +
    "    \"address\": \"Carrera 19 # 125-17\",\n" +
    "    \"lat\": 4.7050109,\n" +
    "    \"lon\": -74.0491015,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Bogotá\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.amazonaws.com/Menus/Logos/pf%20changs.png\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 9,\n" +
    "    \"commerce_image\": \"https://middleware-paymentez.s3.amazonaws.com/Menus/Logos/pf%20changs.png\",\n" +
    "    \"commerce_id\": 62,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"P.F. Chang's\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": \"\",\n" +
    "    \"commerce_name\": \"P.F. Chang's\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 67,\n" +
    "    \"delivery_price\": 100,\n" +
    "    \"max_delivery_distance\": 1000,\n" +
    "    \"accept_delivery\": true,\n" +
    "    \"time_preparing\": 25,\n" +
    "    \"extra_payments_codes\": [],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": null\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 109,\n" +
    "    \"name\": \"La Chispa Roja Villa del Prado\",\n" +
    "    \"address\": \"Cra 55 No. 172 – 04\",\n" +
    "    \"lat\": 4.7550216,\n" +
    "    \"lon\": -74.0566721,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Bogotá\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.amazonaws.com/Menus/Logos/la-chispa-roja.jpg\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 9,\n" +
    "    \"commerce_image\": \"https://middleware-paymentez.s3.amazonaws.com/Menus/Logos/la-chispa-roja.jpg\",\n" +
    "    \"commerce_id\": 63,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"La Chispa Roja\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": null,\n" +
    "    \"commerce_name\": \"La Chispa Roja\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 68,\n" +
    "    \"delivery_price\": 100,\n" +
    "    \"max_delivery_distance\": 10000,\n" +
    "    \"accept_delivery\": true,\n" +
    "    \"time_preparing\": 25,\n" +
    "    \"extra_payments_codes\": [],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"QR a la Mesa - Redeban\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/8c0a366e8d8db6d0a24a77a5f2ed8d61.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/4bf30d0f41582e210c4bf69173a70c61.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/078a544e3ec019962990743c042a5f39.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/ed204d5c862299cf627e6e6503a1cb1b.jpeg\",\n" +
    "      \"color\": \"#0033A1\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0a6d24b99f2cb67c2c67785f921b34d7.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/82046f0a68e46f9471b95a44124fd997.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0858dd8d89e28f85b4a8c3a1bb1e9765.jpeg\"\n" +
    "    }\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 126,\n" +
    "    \"name\": \"Al Alma\",\n" +
    "    \"address\": \"Av. Jardín 70b # 10b 10\",\n" +
    "    \"lat\": null,\n" +
    "    \"lon\": -75.5956925,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Medellín\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Logos/Al-alma-Logo-Store-2.jpg\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 8,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Logos/Al-alma-Logo-Commerce.jpg\",\n" +
    "    \"commerce_id\": 65,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"Al Alma\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": \"\",\n" +
    "    \"commerce_name\": \"65 - Al Alma\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 74,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 25,\n" +
    "    \"extra_payments_codes\": [],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"QR a la Mesa - Redeban\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/8c0a366e8d8db6d0a24a77a5f2ed8d61.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/4bf30d0f41582e210c4bf69173a70c61.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/078a544e3ec019962990743c042a5f39.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/ed204d5c862299cf627e6e6503a1cb1b.jpeg\",\n" +
    "      \"color\": \"#0033A1\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0a6d24b99f2cb67c2c67785f921b34d7.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/82046f0a68e46f9471b95a44124fd997.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0858dd8d89e28f85b4a8c3a1bb1e9765.jpeg\"\n" +
    "    }\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 127,\n" +
    "    \"name\": \"Bagel CO Medellín\",\n" +
    "    \"address\": \"Av. 74b # 39b 143 avenida jardín - laureles\",\n" +
    "    \"lat\": 6.2462183,\n" +
    "    \"lon\": -75.5956925,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Medellín\",\n" +
    "    \"website\": \"\",\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Logos/Bagel-Co-Logo.jpg\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 8,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Logos/Bagel-Co-Logo.jpg\",\n" +
    "    \"commerce_id\": 66,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"Bagel CO\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": null,\n" +
    "    \"commerce_name\": \"66 - Bagel CO\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 75,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 20,\n" +
    "    \"extra_payments_codes\": [],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"Paymentez\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/011be52855c61f03c36b4cfa256ec4b4.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/adfd8077063d14402e98fa5a2a32fbdb.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/daed633a90e1e6561113342600070c23.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/9d88040fe10362de1beb10256bb3db88.jpeg\",\n" +
    "      \"color\": \"#008E6E\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/abd01ae1eec9ea4bfdb139b0ec8a4b9c.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/bfbe78297d2aec919911c6a54c273a79.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/68c3b1c9af14432e96d3db77ed757fc6.jpeg\"\n" +
    "    }\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 128,\n" +
    "    \"name\": \"Pizza CO Medellín\",\n" +
    "    \"address\": \"Av. 74b # 39b 143 avenida jardín - laureles\",\n" +
    "    \"lat\": 6.2462183,\n" +
    "    \"lon\": -75.5956925,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Medellín\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Logos/Pizza-Co-Logo.jpg\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 8,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Logos/Pizza-Co-Logo.jpg\",\n" +
    "    \"commerce_id\": 67,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"Pizza CO\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": \"\",\n" +
    "    \"commerce_name\": \"67 - Pizza CO\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 76,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 20,\n" +
    "    \"extra_payments_codes\": [],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"Paymentez\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/011be52855c61f03c36b4cfa256ec4b4.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/adfd8077063d14402e98fa5a2a32fbdb.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/daed633a90e1e6561113342600070c23.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/9d88040fe10362de1beb10256bb3db88.jpeg\",\n" +
    "      \"color\": \"#008E6E\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/abd01ae1eec9ea4bfdb139b0ec8a4b9c.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/bfbe78297d2aec919911c6a54c273a79.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/68c3b1c9af14432e96d3db77ed757fc6.jpeg\"\n" +
    "    }\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 129,\n" +
    "    \"name\": \"Kokoriko Homecenter Calle 170\",\n" +
    "    \"address\": \"Carrera 45 # 175 - 50 Local 5 Homecenter 170\",\n" +
    "    \"lat\": 4.7554962,\n" +
    "    \"lon\": -74.0487517,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Bogotá\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.amazonaws.com/Menus/Logos/kokoriko.png\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 8,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.amazonaws.com/Menus/Logos/kokoriko.png\",\n" +
    "    \"commerce_id\": 68,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"Kokoriko\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": null,\n" +
    "    \"commerce_name\": \"68 - Kokoriko\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 129,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 20,\n" +
    "    \"extra_payments_codes\": [],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"QR a la Mesa - Redeban\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/8c0a366e8d8db6d0a24a77a5f2ed8d61.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/4bf30d0f41582e210c4bf69173a70c61.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/078a544e3ec019962990743c042a5f39.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/ed204d5c862299cf627e6e6503a1cb1b.jpeg\",\n" +
    "      \"color\": \"#0033A1\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0a6d24b99f2cb67c2c67785f921b34d7.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/82046f0a68e46f9471b95a44124fd997.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0858dd8d89e28f85b4a8c3a1bb1e9765.jpeg\"\n" +
    "    }\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 130,\n" +
    "    \"name\": \"Andrés Exprés Floresta\",\n" +
    "    \"address\": \"av. Cra. 68 # 90-55 C.C. Cafam Floresta Local 2-011\",\n" +
    "    \"lat\": 4.6856712,\n" +
    "    \"lon\": -74.0762245,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Bogotá\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.amazonaws.com/Menus/Logos/andres%20express.jpg\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 8,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.amazonaws.com/Menus/Logos/andres%20express.jpg\",\n" +
    "    \"commerce_id\": 69,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": null,\n" +
    "    \"commerce_name\": \"69 - Andrés Exprés\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 90,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 20,\n" +
    "    \"extra_payments_codes\": [],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"QR a la Mesa - Redeban\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/8c0a366e8d8db6d0a24a77a5f2ed8d61.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/4bf30d0f41582e210c4bf69173a70c61.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/078a544e3ec019962990743c042a5f39.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/ed204d5c862299cf627e6e6503a1cb1b.jpeg\",\n" +
    "      \"color\": \"#0033A1\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0a6d24b99f2cb67c2c67785f921b34d7.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/82046f0a68e46f9471b95a44124fd997.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0858dd8d89e28f85b4a8c3a1bb1e9765.jpeg\"\n" +
    "    }\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 131,\n" +
    "    \"name\": \"Sierra Nevada Chicó\",\n" +
    "    \"address\": \"Calle 99 # 10 -60\",\n" +
    "    \"lat\": 4.68126954,\n" +
    "    \"lon\": -74.0431856,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Bogotá\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.amazonaws.com/Menus/Logos/sierra%20nevada.jpg\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 8,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Productos/Sierra%20Nevada/banner.jpg\",\n" +
    "    \"commerce_id\": 64,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"Sierra Nevada\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": null,\n" +
    "    \"commerce_name\": \"Sierra Nevada\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 81,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 20,\n" +
    "    \"extra_payments_codes\": [\n" +
    "      {\n" +
    "        \"method_reference\": \"DEBIT\",\n" +
    "        \"description\": \"Terminal en mesa\"\n" +
    "      }\n" +
    "    ],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"Paymentez\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/011be52855c61f03c36b4cfa256ec4b4.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/adfd8077063d14402e98fa5a2a32fbdb.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/daed633a90e1e6561113342600070c23.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/9d88040fe10362de1beb10256bb3db88.jpeg\",\n" +
    "      \"color\": \"#008E6E\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/abd01ae1eec9ea4bfdb139b0ec8a4b9c.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/bfbe78297d2aec919911c6a54c273a79.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/68c3b1c9af14432e96d3db77ed757fc6.jpeg\"\n" +
    "    }\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 132,\n" +
    "    \"name\": \"Pizza Hut Santa Ana\",\n" +
    "    \"address\": \"Av cra 9 #124-06 loc 2\",\n" +
    "    \"lat\": 4.700744,\n" +
    "    \"lon\": -74.0326775,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Bogotá\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Productos/Pizza%20Hut/Pizza-Hut-Logo-Blanco.jpg\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 8,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Productos/Pizza%20Hut/Pizza-Hut-Logo-Rojo.jpg\",\n" +
    "    \"commerce_id\": 70,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"Pizza Hut\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": null,\n" +
    "    \"commerce_name\": \"70 - Pizza Hut\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 82,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 20,\n" +
    "    \"extra_payments_codes\": [\n" +
    "      {\n" +
    "        \"method_reference\": \"DEBIT\",\n" +
    "        \"description\": \"Terminal en mesa\"\n" +
    "      }\n" +
    "    ],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"QR a la mesa - Niubiz\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/b0c5a612703f23b22d4614b3f3949a4d.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/b4cc93cf4bcb36f507cfa60280b2c5a0.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/86dde96bae674c4d967425ac8467ae2c.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/83398724d10be44a55a288ce3cf0386d.jpeg\",\n" +
    "      \"color\": \"009FDF\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/c385598e687ee9041a08b7ff68409b4f.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/f26ad3d9d8734ca23cf6b8c1a85dd4dc.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/65adff7394b8fff97b7b78e9e7b9c80f.jpeg\"\n" +
    "    }\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 134,\n" +
    "    \"name\": \"Nativos C.C Metropolis\",\n" +
    "    \"address\": \"AV. 68 # 75A - 50 Local 208B\",\n" +
    "    \"lat\": 4.6804279,\n" +
    "    \"lon\": -74.0820765,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Bogotá\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.amazonaws.com/Menus/Logos/nativos.png\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 0,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.amazonaws.com/Menus/Logos/nativos.png\",\n" +
    "    \"commerce_id\": 72,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"Nativos\",\n" +
    "    \"status\": 2,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": null,\n" +
    "    \"commerce_name\": \"72 - Nativos\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 84,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 15,\n" +
    "    \"extra_payments_codes\": [],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"QR a la Mesa - Redeban\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/8c0a366e8d8db6d0a24a77a5f2ed8d61.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/4bf30d0f41582e210c4bf69173a70c61.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/078a544e3ec019962990743c042a5f39.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/ed204d5c862299cf627e6e6503a1cb1b.jpeg\",\n" +
    "      \"color\": \"#0033A1\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0a6d24b99f2cb67c2c67785f921b34d7.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/82046f0a68e46f9471b95a44124fd997.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0858dd8d89e28f85b4a8c3a1bb1e9765.jpeg\"\n" +
    "    }\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 135,\n" +
    "    \"name\": \"Spaghetto\",\n" +
    "    \"address\": \"Carrera 7 # 26 - 62\",\n" +
    "    \"lat\": 4.61281024,\n" +
    "    \"lon\": -74.0693823,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Bogotá\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.amazonaws.com/Menus/Logos/spaguetto.jpg\",\n" +
    "    \"enable_pay_at_the_table_orders\": false,\n" +
    "    \"type\": 8,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.amazonaws.com/Menus/Logos/spaguetto.jpg\",\n" +
    "    \"commerce_id\": 73,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"Spaghetto\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": null,\n" +
    "    \"commerce_name\": \"73 - Spaguetto\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 85,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 25,\n" +
    "    \"extra_payments_codes\": [],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"Paymentez\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/011be52855c61f03c36b4cfa256ec4b4.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/adfd8077063d14402e98fa5a2a32fbdb.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/daed633a90e1e6561113342600070c23.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/9d88040fe10362de1beb10256bb3db88.jpeg\",\n" +
    "      \"color\": \"#008E6E\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/abd01ae1eec9ea4bfdb139b0ec8a4b9c.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/bfbe78297d2aec919911c6a54c273a79.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/68c3b1c9af14432e96d3db77ed757fc6.jpeg\"\n" +
    "    }\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 136,\n" +
    "    \"name\": \"BBC PUB AV 19\",\n" +
    "    \"address\": \"Av 19 # 120 – 76\",\n" +
    "    \"lat\": 4.7013967,\n" +
    "    \"lon\": -74.0492705,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Bogotá\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Logos/BBC-Logo-Comercio.png\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 8,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Logos/BBC-Logo-Comercio.png\",\n" +
    "    \"commerce_id\": 74,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"BBC\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": null,\n" +
    "    \"commerce_name\": \"74 - BBC QR Redeban\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 86,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 20,\n" +
    "    \"extra_payments_codes\": [],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"QR a la Mesa - Redeban\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/8c0a366e8d8db6d0a24a77a5f2ed8d61.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/4bf30d0f41582e210c4bf69173a70c61.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/078a544e3ec019962990743c042a5f39.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/ed204d5c862299cf627e6e6503a1cb1b.jpeg\",\n" +
    "      \"color\": \"#0033A1\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0a6d24b99f2cb67c2c67785f921b34d7.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/82046f0a68e46f9471b95a44124fd997.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0858dd8d89e28f85b4a8c3a1bb1e9765.jpeg\"\n" +
    "    }\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 137,\n" +
    "    \"name\": \"Gamberro 90\",\n" +
    "    \"address\": \"Cll 90 #11-13 Local 16\",\n" +
    "    \"lat\": 4.6721127,\n" +
    "    \"lon\": -74.048968,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Bogotá\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Logos/Gamberro-logo.jpeg\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 8,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Logos/Gamberro-logo.jpeg\",\n" +
    "    \"commerce_id\": 75,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"Gamberro\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": null,\n" +
    "    \"commerce_name\": \"75 - Gamberro - QR Redeban\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 87,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 20,\n" +
    "    \"extra_payments_codes\": [],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"QR a la Mesa - Redeban\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/8c0a366e8d8db6d0a24a77a5f2ed8d61.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/4bf30d0f41582e210c4bf69173a70c61.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/078a544e3ec019962990743c042a5f39.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/ed204d5c862299cf627e6e6503a1cb1b.jpeg\",\n" +
    "      \"color\": \"#0033A1\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0a6d24b99f2cb67c2c67785f921b34d7.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/82046f0a68e46f9471b95a44124fd997.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0858dd8d89e28f85b4a8c3a1bb1e9765.jpeg\"\n" +
    "    }\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 138,\n" +
    "    \"name\": \"Semolina C.C. Parque la Colina\",\n" +
    "    \"address\": \"Cra 58d # 145 - 51 Local B01\",\n" +
    "    \"lat\": 4.7327856,\n" +
    "    \"lon\": -74.0659365,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Bogotá\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Logos/Semolina%20-%20logo.jpg\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 8,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Logos/Semolina%20-%20logo.jpg\",\n" +
    "    \"commerce_id\": 76,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"Semolina\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": \"\",\n" +
    "    \"commerce_name\": \"76 - Semolina\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 88,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 20,\n" +
    "    \"extra_payments_codes\": [],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"QR a la Mesa - Redeban\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/8c0a366e8d8db6d0a24a77a5f2ed8d61.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/4bf30d0f41582e210c4bf69173a70c61.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/078a544e3ec019962990743c042a5f39.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/ed204d5c862299cf627e6e6503a1cb1b.jpeg\",\n" +
    "      \"color\": \"#0033A1\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0a6d24b99f2cb67c2c67785f921b34d7.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/82046f0a68e46f9471b95a44124fd997.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0858dd8d89e28f85b4a8c3a1bb1e9765.jpeg\"\n" +
    "    }\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 139,\n" +
    "    \"name\": \"La Plaza de Andrés C.C. Hacienda Santa Bárbara\",\n" +
    "    \"address\": \"Cra. 7 # 115 - 72, Tercer Piso\",\n" +
    "    \"lat\": 4.693434,\n" +
    "    \"lon\": -74.0331157,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Bogotá\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Logos/La%20Plaza%20de%20Andr%C3%A9s%20-%20Logo.jpg\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 8,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Logos/La%20Plaza%20de%20Andr%C3%A9s%20-%20Logo.jpg\",\n" +
    "    \"commerce_id\": 71,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"La Plaza de Andrés\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": null,\n" +
    "    \"commerce_name\": \"71- La Plaza de Andrés\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 109,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 20,\n" +
    "    \"extra_payments_codes\": [],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"QR a la Mesa - Redeban\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/8c0a366e8d8db6d0a24a77a5f2ed8d61.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/4bf30d0f41582e210c4bf69173a70c61.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/078a544e3ec019962990743c042a5f39.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/ed204d5c862299cf627e6e6503a1cb1b.jpeg\",\n" +
    "      \"color\": \"#0033A1\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0a6d24b99f2cb67c2c67785f921b34d7.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/82046f0a68e46f9471b95a44124fd997.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0858dd8d89e28f85b4a8c3a1bb1e9765.jpeg\"\n" +
    "    }\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 140,\n" +
    "    \"name\": \"Momotea Arkadia EN\",\n" +
    "    \"address\": \"C.C. Arkadia - Carrera 70 # 1-141 - Local K1-11\",\n" +
    "    \"lat\": 6.2124314,\n" +
    "    \"lon\": -75.5946188,\n" +
    "    \"country\": \"MX\",\n" +
    "    \"city\": \"Medellín\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.amazonaws.com/Menus/Logos/Momotea.jpg\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 9,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.amazonaws.com/Menus/Logos/Momotea.jpg\",\n" +
    "    \"commerce_id\": 57,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"Momotea\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": null,\n" +
    "    \"commerce_name\": \"Momotea\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 94,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 20,\n" +
    "    \"extra_payments_codes\": [\n" +
    "      {\n" +
    "        \"method_reference\": \"DEBIT\",\n" +
    "        \"description\": \"Terminal en mesa\"\n" +
    "      }\n" +
    "    ],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"Banorte Demo\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/4227e9104381d195c65a692a788063aa.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/1046965cf1814bac74c9687293bc665f.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/4fa647deac6bfa230d581f8a097be462.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/6eb128d7480b76801c1e4ff244c523b4.jpeg\",\n" +
    "      \"color\": \"#c6403d\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/417a2778ae082fc27643fa58523ec086.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/494660a5d2c6393476260f2ea0d4772e.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/f38b76db0f759b81d479bbb62fee57b0.jpeg\"\n" +
    "    }\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 141,\n" +
    "    \"name\": \"Pizza CO En\",\n" +
    "    \"address\": \"Av. 74b # 39b 143 avenida jardín - laureles\",\n" +
    "    \"lat\": 6.2462183,\n" +
    "    \"lon\": -75.5956925,\n" +
    "    \"country\": \"SG\",\n" +
    "    \"city\": null,\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Logos/Pizza-Co-Logo.jpg\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 9,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Logos/Pizza-Co-Logo.jpg\",\n" +
    "    \"commerce_id\": 67,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"Pizza CO\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": null,\n" +
    "    \"commerce_name\": \"67 - Pizza CO\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 95,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 15,\n" +
    "    \"extra_payments_codes\": [],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"QR-Mastercard\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/ced7df70049391bde97fe84e04851730.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/76e2061f936ee2b2d64de564c3edbc52.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/9030a6f816467bd181367adb77d5219e.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/c1d9fc88ea3cd501c98301ae3335ee61.jpeg\",\n" +
    "      \"color\": \"#000000\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/785040ea4452df7fe62f88a6df7cbb5a.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/a6db91963773c2a80c386d5726fefdef.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0f9d5d7540e00036afa61c9745773e83.jpeg\"\n" +
    "    }\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 142,\n" +
    "    \"name\": \"Bagel CO Medellín En\",\n" +
    "    \"address\": \"Av. 74b # 39b 143 avenida jardín - laureles\",\n" +
    "    \"lat\": 6.2462183,\n" +
    "    \"lon\": -75.5956925,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Medellín\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Logos/Bagel-Co-Logo.jpg\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 9,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Logos/Bagel-Co-Logo.jpg\",\n" +
    "    \"commerce_id\": 66,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"Bagel CO\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": null,\n" +
    "    \"commerce_name\": \"66 - Bagel CO\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 96,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 20,\n" +
    "    \"extra_payments_codes\": [\n" +
    "      {\n" +
    "        \"method_reference\": \"DEBIT\",\n" +
    "        \"description\": \"Terminal en mesa\"\n" +
    "      }\n" +
    "    ],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"QR-Mastercard\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/ced7df70049391bde97fe84e04851730.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/76e2061f936ee2b2d64de564c3edbc52.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/9030a6f816467bd181367adb77d5219e.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/c1d9fc88ea3cd501c98301ae3335ee61.jpeg\",\n" +
    "      \"color\": \"#000000\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/785040ea4452df7fe62f88a6df7cbb5a.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/a6db91963773c2a80c386d5726fefdef.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0f9d5d7540e00036afa61c9745773e83.jpeg\"\n" +
    "    }\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 143,\n" +
    "    \"name\": \"Andrés DC Chía\",\n" +
    "    \"address\": \"Carrera 3 Este # 11 A 59, Chía, Cundinamarca\",\n" +
    "    \"lat\": 4.853977,\n" +
    "    \"lon\": -74.0652472,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Chía\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Logos/Andres%20DC%20Logo.png\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 9,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Logos/La%20Plaza%20de%20Andr%C3%A9s%20-%20Logo.jpg\",\n" +
    "    \"commerce_id\": 71,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"Andrés DC\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": \"PMTZ-QROTT\",\n" +
    "    \"commerce_name\": \"71- La Plaza de Andrés\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 100,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 20,\n" +
    "    \"extra_payments_codes\": [],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"QR a la Mesa - Redeban\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/8c0a366e8d8db6d0a24a77a5f2ed8d61.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/4bf30d0f41582e210c4bf69173a70c61.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/078a544e3ec019962990743c042a5f39.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/ed204d5c862299cf627e6e6503a1cb1b.jpeg\",\n" +
    "      \"color\": \"#0033A1\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0a6d24b99f2cb67c2c67785f921b34d7.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/82046f0a68e46f9471b95a44124fd997.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0858dd8d89e28f85b4a8c3a1bb1e9765.jpeg\"\n" +
    "    }\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 144,\n" +
    "    \"name\": \"Andrés Exprés Paradero Chía\",\n" +
    "    \"address\": \"Calle 3 #11A-56 Chía, frente ACR\",\n" +
    "    \"lat\": 4.8537217,\n" +
    "    \"lon\": -74.0649531,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Colombia\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Productos/Andr%C3%A9s%20Expr%C3%A9s/Logo-Andres-Expr%C3%A9s.jpg\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 9,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.amazonaws.com/Menus/Logos/andres%20express.jpg\",\n" +
    "    \"commerce_id\": 69,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"Andrés Express\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": \"PMTZ-QROTT\",\n" +
    "    \"commerce_name\": \"69 - Andrés Exprés\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 107,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 20,\n" +
    "    \"extra_payments_codes\": [],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"QR a la Mesa - Redeban\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/8c0a366e8d8db6d0a24a77a5f2ed8d61.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/4bf30d0f41582e210c4bf69173a70c61.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/078a544e3ec019962990743c042a5f39.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/ed204d5c862299cf627e6e6503a1cb1b.jpeg\",\n" +
    "      \"color\": \"#0033A1\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0a6d24b99f2cb67c2c67785f921b34d7.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/82046f0a68e46f9471b95a44124fd997.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0858dd8d89e28f85b4a8c3a1bb1e9765.jpeg\"\n" +
    "    }\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 147,\n" +
    "    \"name\": \"Mimo's Fontanar\",\n" +
    "    \"address\": \"Avenida Cajicá # 143 -78 C.C Fontanar\",\n" +
    "    \"lat\": 4.88389,\n" +
    "    \"lon\": -74.035215,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Chía\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Logos/Logo-mimos-agosto2020.jpg\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 9,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Productos/Mimos/mimos-logo.jpg\",\n" +
    "    \"commerce_id\": 77,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"Mimo's - PCA\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": \"PMTZ-QROTT\",\n" +
    "    \"commerce_name\": \"77 - Mimo's qr\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 130,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 25,\n" +
    "    \"extra_payments_codes\": [],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"QR a la Mesa - Redeban\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/8c0a366e8d8db6d0a24a77a5f2ed8d61.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/4bf30d0f41582e210c4bf69173a70c61.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/078a544e3ec019962990743c042a5f39.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/ed204d5c862299cf627e6e6503a1cb1b.jpeg\",\n" +
    "      \"color\": \"#0033A1\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0a6d24b99f2cb67c2c67785f921b34d7.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/82046f0a68e46f9471b95a44124fd997.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0858dd8d89e28f85b4a8c3a1bb1e9765.jpeg\"\n" +
    "    }\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 149,\n" +
    "    \"name\": \"Andrés carne de Res Hipódromo de los Andes-Evento Jessi Uribe\",\n" +
    "    \"address\": \"Autopista Norte Km. 20, Chía, Cundinamarca\",\n" +
    "    \"lat\": 4.8488455,\n" +
    "    \"lon\": -74.0335534,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Bogotá\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Productos/Andres%20DC/Menu%20Jessi%20Uribe/logo_andres_chia.png\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 9,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Logos/La%20Plaza%20de%20Andr%C3%A9s%20-%20Logo.jpg\",\n" +
    "    \"commerce_id\": 71,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"Andrés Carne de Res\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": \"\",\n" +
    "    \"commerce_name\": \"71- La Plaza de Andrés\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 134,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 30,\n" +
    "    \"extra_payments_codes\": [\n" +
    "      {\n" +
    "        \"method_reference\": \"DEBIT\",\n" +
    "        \"description\": \"Pago con datáfono\"\n" +
    "      }\n" +
    "    ],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"QR a la Mesa - Redeban\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/8c0a366e8d8db6d0a24a77a5f2ed8d61.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/4bf30d0f41582e210c4bf69173a70c61.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/078a544e3ec019962990743c042a5f39.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/ed204d5c862299cf627e6e6503a1cb1b.jpeg\",\n" +
    "      \"color\": \"#0033A1\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0a6d24b99f2cb67c2c67785f921b34d7.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/82046f0a68e46f9471b95a44124fd997.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0858dd8d89e28f85b4a8c3a1bb1e9765.jpeg\"\n" +
    "    }\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 154,\n" +
    "    \"name\": \"La Brasa Roja Bello - Menú Medellín\",\n" +
    "    \"address\": \"Cra.49 No.46-84 Bello, Antioquia\",\n" +
    "    \"lat\": 6.24698,\n" +
    "    \"lon\": -75.568238,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Bogotá\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Productos/CBC/LA%20BRASA%20ROJA/LOGO%20BRASA%20ROJA.jpg\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 9,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Productos/CBC/LA%20BRASA%20ROJA/BANNER%20LA%20BRASA%20ROJA.png\",\n" +
    "    \"commerce_id\": 79,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": null,\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": null,\n" +
    "    \"commerce_name\": \"79 - La Brasa Roja\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 127,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 25,\n" +
    "    \"extra_payments_codes\": [],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"Banorte Demo\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/4227e9104381d195c65a692a788063aa.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/1046965cf1814bac74c9687293bc665f.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/4fa647deac6bfa230d581f8a097be462.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/6eb128d7480b76801c1e4ff244c523b4.jpeg\",\n" +
    "      \"color\": \"#c6403d\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/417a2778ae082fc27643fa58523ec086.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/494660a5d2c6393476260f2ea0d4772e.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/f38b76db0f759b81d479bbb62fee57b0.jpeg\"\n" +
    "    }\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 157,\n" +
    "    \"name\": \"La Brasa Roja Bosa - Grupo 3A\",\n" +
    "    \"address\": \"DG 69 B SUR # 78 • LC 04\",\n" +
    "    \"lat\": 4.6030775,\n" +
    "    \"lon\": -74.1906923,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Bogotá\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Productos/CBC/LA%20BRASA%20ROJA/LOGO%20BRASA%20ROJA.jpg\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 9,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Productos/CBC/LA%20BRASA%20ROJA/BANNER%20LA%20BRASA%20ROJA.png\",\n" +
    "    \"commerce_id\": 79,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": null,\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": null,\n" +
    "    \"commerce_name\": \"79 - La Brasa Roja\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 120,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 25,\n" +
    "    \"extra_payments_codes\": [],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"QR a la Mesa - Redeban\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/8c0a366e8d8db6d0a24a77a5f2ed8d61.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/4bf30d0f41582e210c4bf69173a70c61.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/078a544e3ec019962990743c042a5f39.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/ed204d5c862299cf627e6e6503a1cb1b.jpeg\",\n" +
    "      \"color\": \"#0033A1\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0a6d24b99f2cb67c2c67785f921b34d7.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/82046f0a68e46f9471b95a44124fd997.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0858dd8d89e28f85b4a8c3a1bb1e9765.jpeg\"\n" +
    "    }\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 158,\n" +
    "    \"name\": \"La Brasa Roja La Merced - Cali - Grupo BRC 2,3,5,6,10,12\",\n" +
    "    \"address\": \"Av.3 NTE.No.49-06\",\n" +
    "    \"lat\": 3.482064,\n" +
    "    \"lon\": -76.514401,\n" +
    "    \"country\": \"CO\",\n" +
    "    \"city\": \"Cali\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Productos/CBC/LA%20BRASA%20ROJA/LOGO%20BRASA%20ROJA.jpg\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 9,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Productos/CBC/LA%20BRASA%20ROJA/BANNER%20LA%20BRASA%20ROJA.png\",\n" +
    "    \"commerce_id\": 79,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"La Brasa Roja\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": null,\n" +
    "    \"commerce_name\": \"79 - La Brasa Roja\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 125,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 25,\n" +
    "    \"extra_payments_codes\": [\n" +
    "      {\n" +
    "        \"method_reference\": \"DEBIT\",\n" +
    "        \"description\": \"Pago con datafono\"\n" +
    "      }\n" +
    "    ],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"QR a la Mesa - Redeban\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/8c0a366e8d8db6d0a24a77a5f2ed8d61.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/4bf30d0f41582e210c4bf69173a70c61.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/078a544e3ec019962990743c042a5f39.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/ed204d5c862299cf627e6e6503a1cb1b.jpeg\",\n" +
    "      \"color\": \"#0033A1\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0a6d24b99f2cb67c2c67785f921b34d7.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/82046f0a68e46f9471b95a44124fd997.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0858dd8d89e28f85b4a8c3a1bb1e9765.jpeg\"\n" +
    "    }\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 159,\n" +
    "    \"name\": \"El Bodegón Argentino Quito\",\n" +
    "    \"address\": \"San Francisco N41-111 y, Mariano Echeverria, Quito\",\n" +
    "    \"lat\": -0.1661076,\n" +
    "    \"lon\": -78.4887193,\n" +
    "    \"country\": \"EC\",\n" +
    "    \"city\": \"Quito\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://pbs.twimg.com/profile_images/869624785235587075/26re2DlA_400x400.jpg\",\n" +
    "    \"enable_pay_at_the_table_orders\": null,\n" +
    "    \"type\": 9,\n" +
    "    \"commerce_image\": \"https://pbs.twimg.com/profile_images/869624785235587075/26re2DlA_400x400.jpg\",\n" +
    "    \"commerce_id\": 81,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"El Bodegón Argentino\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": \"QRRBMOTT-TEST-SEBAS-CVV\",\n" +
    "    \"internal_name\": null,\n" +
    "    \"commerce_name\": \"El Bodegón Argentino Quito\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": null,\n" +
    "    \"menu_id\": 117,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": 20,\n" +
    "    \"extra_payments_codes\": [\n" +
    "      {\n" +
    "        \"method_reference\": \"DEBIT\",\n" +
    "        \"description\": \"Pago con datáfono\"\n" +
    "      }\n" +
    "    ],\n" +
    "    \"server_app_code\": \"QRRBMOTT-TEST-SEBAS-CVV\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"PacifiCard\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/06a86edaf1978799ba46f8f131da477e.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/1e247c0ca2c7fb96453aa5ec208e9958.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/c5f9f3ee0fbe4e1f67a4aa1aa482ba94.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/64c8e73171dceff3eee07c1623b835c9.jpeg\",\n" +
    "      \"color\": \"009FDF\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/3239c01cee4babc4af3e0af46bef6446.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/f26ad3d9d8734ca23cf6b8c1a85dd4dc.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/65adff7394b8fff97b7b78e9e7b9c80f.jpeg\"\n" +
    "    }\n" +
    "  },\n" +
    "  {\n" +
    "    \"id\": 160,\n" +
    "    \"name\": \"QR On The Table\",\n" +
    "    \"address\": \"Cra 13 # 83 - 19\",\n" +
    "    \"lat\": 4.668053,\n" +
    "    \"lon\": -74.054386,\n" +
    "    \"country\": \"Colombia\",\n" +
    "    \"city\": \"Bogotá\",\n" +
    "    \"website\": null,\n" +
    "    \"phone\": null,\n" +
    "    \"image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Logos/generic-qr.png\",\n" +
    "    \"enable_pay_at_the_table_orders\": false,\n" +
    "    \"type\": 0,\n" +
    "    \"commerce_image\": \"https://middleware-prod-paymentez.s3.us-east-1.amazonaws.com/Menus/Logos/Al-alma-Logo-Commerce.jpg\",\n" +
    "    \"commerce_id\": 65,\n" +
    "    \"commerce_fiscal_number\": null,\n" +
    "    \"subsidiary_id\": null,\n" +
    "    \"zip_code\": null,\n" +
    "    \"company_name\": \"Al Alma\",\n" +
    "    \"status\": 1,\n" +
    "    \"commerce_paymentez_app_code\": null,\n" +
    "    \"internal_name\": \"PMTZ-QROTT\",\n" +
    "    \"commerce_name\": \"65 - Al Alma\",\n" +
    "    \"show_stock\": true,\n" +
    "    \"print\": true,\n" +
    "    \"menu_id\": 74,\n" +
    "    \"delivery_price\": null,\n" +
    "    \"max_delivery_distance\": null,\n" +
    "    \"accept_delivery\": false,\n" +
    "    \"time_preparing\": null,\n" +
    "    \"extra_payments_codes\": [\n" +
    "      {\n" +
    "        \"method_reference\": \"DEBIT\",\n" +
    "        \"description\": \"Pago con datáfono\"\n" +
    "      }\n" +
    "    ],\n" +
    "    \"server_app_code\": \"FALTA\",\n" +
    "    \"clien_app_code\": \"FALTA\",\n" +
    "    \"sponsor\": {\n" +
    "      \"name\": \"QR a la Mesa - Redeban\",\n" +
    "      \"logo\": \"https://middleware-prod-paymentez.s3.amazonaws.com/8c0a366e8d8db6d0a24a77a5f2ed8d61.jpeg\",\n" +
    "      \"icon\": \"https://middleware-prod-paymentez.s3.amazonaws.com/4bf30d0f41582e210c4bf69173a70c61.jpeg\",\n" +
    "      \"loader\": \"https://middleware-prod-paymentez.s3.amazonaws.com/078a544e3ec019962990743c042a5f39.jpeg\",\n" +
    "      \"header_email\": \"https://middleware-prod-paymentez.s3.amazonaws.com/ed204d5c862299cf627e6e6503a1cb1b.jpeg\",\n" +
    "      \"color\": \"#0033A1\",\n" +
    "      \"splash\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0a6d24b99f2cb67c2c67785f921b34d7.jpeg\",\n" +
    "      \"transaction_success\": \"https://middleware-prod-paymentez.s3.amazonaws.com/82046f0a68e46f9471b95a44124fd997.jpeg\",\n" +
    "      \"transaction_error\": \"https://middleware-prod-paymentez.s3.amazonaws.com/0858dd8d89e28f85b4a8c3a1bb1e9765.jpeg\"\n" +
    "    }\n" +
    "  }\n" +
    "]"
    
}
