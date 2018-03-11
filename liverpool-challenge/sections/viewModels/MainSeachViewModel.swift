//
//  MainSeachViewModel.swift
//  liverpool-challenge
//
//  Created by Carlos Vázquez Gómez on 3/10/18.
//  Copyright © 2018 Carlos Vázquez Gómez. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire

typealias completionHandler = ([Products]?, Error?) -> Void

class MainSeachViewModel {
    
    func fetchProducts(_with text: String, completion:@escaping completionHandler) {
        //TODO:temporal construction of URL
        let path = "https://www.liverpool.com.mx/tienda/?s=" + text + "&d3106047a194921c01969dfdec083925=json"
        
        guard let url = URL(string: path) else { return }
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default) .responseString { response in
            switch response.result {
            case .success:
                if let model = Mapper<ProductsResult>().map(JSONString: response.result.value!) {
                    completion(model.products, nil)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
        
    }
}
