import Foundation

public class PmzConfiguration {
    
    public var id: CLong?
    public var annotations: String?
    public var description: String?
    public var type: Int?
    public var cost: Double?
    public var configurationId: CLong?
    public var discount: Double?
    
    init(){}
    
    init(configId: CLong) {
        configurationId = configId
    }
    
    init(dictionary: [String: Any]) {
        if let id = dictionary["id"] as? CLong {
            self.id = id
        }
        if let annotations = dictionary["annotations"] as? String {
            self.annotations = annotations
        }
        if let description = dictionary["description"] as? String {
            self.description = description
        }
        if let type = dictionary["type"] as? Int {
            self.type = type
        }
        if let cost = dictionary["cost"] as? Double {
            self.cost = cost
        }
        if let configurationId = dictionary["configuration_id"] as? CLong {
            self.configurationId = configurationId
        }
        if let discount = dictionary["discount"] as? Double {
            self.discount = discount
        }
    }
    
    static func getJSON(configurations: [PmzConfiguration]?) -> NSArray {
        let array = NSMutableArray()
        if(configurations != nil) {
            for configuration in configurations! {
                array.add([API.K.ParameterKey.configurationId: configuration.configurationId!])
            }
        }
        return array
    }
    
    func copy() -> PmzConfiguration {
        let config = PmzConfiguration()
        config.id = self.id
        config.annotations = self.annotations
        config.description = self.description
        config.type = self.type
        config.cost = self.cost
        config.configurationId = self.configurationId
        config.discount = self.discount
        return config
    }
}
