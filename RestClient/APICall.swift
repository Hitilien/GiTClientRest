//
//  APICall.swift
//  RESTApiCall
//
//  Created by Alejandro Vargaz on 12/07/17.
//  Copyright © 2017 Alejandro Vargas. All rights reserved.
//

import Foundation


// MARK: - HttpMethod

public enum HttpMethod: Int, CustomStringConvertible
{
    case get
    case post
    case update
    case delete
    
    public var description: String
    {
        switch self
        {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .update:
            return "UPDATE"
        case .delete:
            return "DELETE"
        }
    }
}

// MARK: - APICall

public class APICall : NSObject
{
    // change with your Constants
    public static var debug = true
    
    public static var isEnvelopment: Bool = true;
    
    public class func request(method       :   HttpMethod  = .get,
                       url          :   String,
                       params       :   [String:AnyObject]? = nil,
                       headers      :   [String: String]? = nil,
                       completion   :   @escaping (AnyObject?, Bool, String?)-> Void)
    {
        
        // set up the URL request
        let endpoint: String = url + (isEnvelopment ? "?envelopment=true" : "")
        
        guard let url = URL(string: endpoint) else {
            APICall.log("ERROR: Cannot create URL")
            return
        }
    
        
        var urlRequest          = URLRequest(url: url )
        urlRequest.httpMethod   = method.description
        urlRequest.allHTTPHeaderFields = headers
        
        if let body = params {
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
                urlRequest.httpBody = jsonData
            } catch {
                print(error.localizedDescription)
            }
        }
        
        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        
        // make the request
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            
            // check for any errors
            guard error == nil else {
                APICall.log("ERROR: Calling \(String(describing: error))")
                completion(nil, false, error?.localizedDescription)
                return
            }
            
            // make sure we got data
            guard let responseData = data else {
                APICall.log("ERROR: Did not receive data")
                completion(nil, false, error?.localizedDescription)
                return
            }
            
            // parse the result as JSON, since that's what the API provides
            do {
                guard let json = try JSONSerialization.jsonObject(with: responseData) as? [String: AnyObject] else {
                    APICall.log("ERROR: Trying to convert data to JSON")
                    completion(nil, false, "ERROR: Trying to convert data to JSON")
                    return
                }
                
                // Print it to prove we can access it
                APICall.log("JSON: " + json.description)
                completion(json as AnyObject, true, nil)
            
//                
//                // TEST ___________________________________________________
//                guard let something = json["Something"] as? String else {
//                    APICall.log("Could not get Something from JSON")
//                    return
//                }
//                APICall.log("The Something is: " + something)
//                // TEST ___________________________________________________
                
                
            }
            catch {
                APICall.log("ERROR: Trying to convert data to JSON")
                completion(nil, false, "ERROR: Trying to convert data to JSON")
                return
            }
        }
        
        task.resume()
    }
}


// MARK: - LOGS

extension APICall
{
    class func log(_ logs : String)
    {
        if (APICall.debug == true)
        {
            print("APICall | " + logs)
        }
    }
}
