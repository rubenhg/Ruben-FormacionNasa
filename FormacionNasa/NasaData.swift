//
//  NasaData.swift
//  FormacionNasa
//
//  Created by Ruben Higueras Galan on 29/10/2020.
//  Copyright © 2020 Ruben Higueras Galan. All rights reserved.
//

import Foundation

class NasaData {
    
    let date: String?
    let title: String?
    let image: String?
    let explanation: String?
    
    init(fromJson json: [String : Any]) {
        self.date = json["date"] as? String
        self.title = json["title"] as? String
        self.image = json["url"] as? String
        self.explanation = json["explanation"] as? String
    
    }
}
