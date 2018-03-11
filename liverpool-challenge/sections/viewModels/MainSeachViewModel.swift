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

typealias completionHandler = ([Product]?, Error?) -> Void

class MainSeachViewModel {
    
    func fetchProducts(_with text: String, completion:@escaping completionHandler) {
        let path = "https://www.liverpool.com.mx/tienda"
        let parameters:Parameters = [
            "s": text,
            "d3106047a194921c01969dfdec083925": "json"
        ]
        
        guard let url = URL(string: path) else { return }
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default) .responseString { response in
            switch response.result {
            case .success:
                if let model = Mapper<MappingResult>().map(JSONString: response.result.value!),
                   let content = Mapper<ContentResult>().map(JSON: model.contents![0]),
                   let mainContent = Mapper<MainContentResult>().map(JSON: content.mainContent![3]),
                   let records = Mapper<RecordsResult>().map(JSON: mainContent.contents![0]) {
                    completion(records.products, nil)
                }
                
            case .failure(let error):
                completion(nil, error)
            }
        }
        
    }
}
