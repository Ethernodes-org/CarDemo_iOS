//
// DefaultAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Alamofire
import UIKit

open class DefaultAPI: APIBase {
    
    /*
     - parameter completion: completion handler to receive the data and the error objects
     */
    //get data
    open class func getSIMBAData(completion: @escaping ((_ data: [GetRegModel]?,_ statusCode: Int?) -> Void)) {
        print("getSIMBAData")
        getSIMBADataWithRequestBuilder().execute { (response, error) -> Void in
            print("getSIMBADataWithRequestBuilderCALLED")
            // completion(response?.body, error);
            completion(response?.body, response?.statusCode)
            print(response?.statusCode)
           //  let statusCodeSTR = String(response!.statusCode)
            // print("GET DATA API CODE: " + statusCodeSTR)
        }
    }
    
    
    open class func getSIMBADataWithRequestBuilder() -> RequestBuilder<[GetRegModel]> {
        print("getSIMBADataWithRequestBuilderEXECUTED")
        let path = "/v1/CarDemoiOS/registerCar"
        let URLString = SwaggerClientAPI.basePath + path
        
        let nillableParameters: [String:Any?] = [:]
        
        let parameters = APIHelper.rejectNil(nillableParameters)
        
        let convertedParameters = APIHelper.convertBoolToString(parameters)
        
        let requestBuilder: RequestBuilder<[GetRegModel]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()
        
        return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, isBody: true)
    }
    
    //post data
    open class func postSIMBAData(payload: GetRegModel, completion: @escaping ((_ error: Error?) -> Void)) {
        postSIMBADataWithRequestBuilder(payload: payload).execute { (response, error) -> Void in
            completion(error);
        }
    }
    
    
    open class func postSIMBADataWithRequestBuilder(payload: GetRegModel) -> RequestBuilder<Void> {
        let path = "/audit"//change to audit when ready to test POSTs
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = payload.encodeToJSON() as? [String:AnyObject]
        
        let convertedParameters = APIHelper.convertBoolToString(parameters)
        
        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()
        
        return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, isBody: true)
    }
    
}