//
//  WebService.swift
//  FormacionNasa
//
//  Created by Ruben Higueras Galan on 29/10/2020.
//  Copyright © 2020 Ruben Higueras Galan. All rights reserved.
//

import Foundation
import Alamofire

class WebService{
    static let sharedInstance = WebService()
    
     func getData(date: String,completionHandler: @escaping ([String : Any]?, AFError?) -> Void) {
        
        AF.request("https://api.nasa.gov/planetary/apod?api_key=XinaivKeLDrbocichMnd545VMmHJw7ByWSefDESQ&date=\(date)").validate().responseJSON { (response) in
            
            let result = self.resultFromJsonResponse(response: response)
            
            if result.0 != nil {
                completionHandler(result.0, nil)
            } else {
                completionHandler(nil, result.1)
            }
        }
    }
    
    private func resultFromJsonResponse(response: AFDataResponse<Any>) -> ([String : Any]?, AFError?) {
        
        switch response.result {
        case .success(let value):
            return (value as? [String : Any], nil)
        case .failure(let error):
            return (nil, error)
        }
    }
}
