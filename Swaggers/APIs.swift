// APIs.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation

open class SwaggerClientAPI {
    public static var basePath = "https://api.simbachain.com/v1/ioscardemo2/"
    public static var credential: URLCredential?
    //This is where you put your api key from simba
    public static var customHeaders: [String:String] = ["APIKEY":"0ce2c6f644fa15bfb25520394392af4f835153a6be1beff0c096988d647a97c4"]
    static var requestBuilderFactory: RequestBuilderFactory = AlamofireRequestBuilderFactory()
}

open class APIBase {
    func toParameters(_ encodable: JSONEncodable?) -> [String: Any]? {
        let encoded: Any? = encodable?.encodeToJSON()
        
        if encoded! is [Any] {
            var dictionary = [String:Any]()
            for (index, item) in (encoded as! [Any]).enumerated() {
                dictionary["\(index)"] = item
            }
            return dictionary
        } else {
            return encoded as? [String:Any]
        }
    }
}

open class RequestBuilder<T> {
    var credential: URLCredential?
    var headers: [String:String] = [:]
    let parameters: [String:Any]?
    let isBody: Bool
    let method: String
    let URLString: String
    
    /// Optional block to obtain a reference to the request's progress instance when available.
    public var onProgressReady: ((Progress) -> ())?
    
    required public init(method: String, URLString: String, parameters: [String:Any]?, isBody: Bool) {
        self.method = method
        self.URLString = URLString
        self.parameters = parameters
        self.isBody = isBody
        addHeaders(SwaggerClientAPI.customHeaders)
    }
    
    open func addHeaders(_ aHeaders:[String:String]) {
        for (header, value) in aHeaders {
            headers[header] = value
        }
    }
    
    open func execute(_ completion: @escaping (_ response: Response<T>?, _ error: Error?) -> Void) {print("execute in API.swift") }
    
    public func addHeader(name: String, value: String) -> Self {
        if !value.isEmpty {
            headers[name] = value
            
        }
        return self
    }
    
    open func addCredential() -> Self {
        self.credential = SwaggerClientAPI.credential
        return self
    }
}

public protocol RequestBuilderFactory {
    func getBuilder<T>() -> RequestBuilder<T>.Type
}

