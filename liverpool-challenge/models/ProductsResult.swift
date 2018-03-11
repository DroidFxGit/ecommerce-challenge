//
//  ProductsResult.swift
//  liverpool-challenge
//
//  Created by Carlos Vázquez Gómez on 3/10/18.
//  Copyright © 2018 Carlos Vázquez Gómez. All rights reserved.
//

import UIKit
import ObjectMapper

struct MappingResult: Mappable {
    
    var contents: [[String: Any]]?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        contents <- map["contents"]
    }
}

struct ContentResult: Mappable {
    
    var mainContent: [[String: Any]]?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        mainContent <- map["mainContent"]
    }
}

struct MainContentResult: Mappable {
    var contents: [[String: Any]]?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        contents <- map["contents"]
    }
}

struct RecordsResult: Mappable {
    var products: [Product]?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        products <- map["records"]
    }
}

struct Product: Mappable {
    
    var imageUrl: String?
    var mainPrice: String?
    var displayName: String?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        imageUrl <- map["attributes->product.smallImage->0->value", delimiter: "->"]
        mainPrice <- map["attributes->sku.list_Price->0->value", delimiter: "->"]
        displayName <- map["attributes->product.displayName->0->value", delimiter: "->"]
    }
}
