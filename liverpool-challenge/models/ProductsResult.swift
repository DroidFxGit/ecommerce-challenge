//
//  ProductsResult.swift
//  liverpool-challenge
//
//  Created by Carlos Vázquez Gómez on 3/10/18.
//  Copyright © 2018 Carlos Vázquez Gómez. All rights reserved.
//

import UIKit
import ObjectMapper

struct ProductsResult: Mappable {
    
    var products: [Products]?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        products <- map["contents.mainContent.contents.records"]
    }
}

struct Products: Mappable {
    
    var imageUrl: String?
    var mainPrice: String?
    var displayName: String?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        imageUrl <- map["attributes.product.smallImage"]
        mainPrice <- map["attributes.sku.list_Price"]
        displayName <- map["attributes.product.displayName"]
    }
}
