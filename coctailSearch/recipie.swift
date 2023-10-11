//
//  recipie.swift
//  coctailSearch
//
//  Created by Alua Nurakhanova on 11.10.2023.
//

import Foundation
import SwiftyJSON


struct Character{
    var fullName : String = ""
    var family : String = ""
    var imageUrl : String = ""
    var title : String = ""
  
    init (){
        
    }
    init (json : JSON){
        if let item = json["fullName"].string{
            fullName = item
        }
        if let item = json["family"].string{
            family = item
        }
        if let item = json["imageUrl"].string{
            imageUrl = item
        }
        if let item = json["title"].string{
            title = item
        }
       
    }
}
