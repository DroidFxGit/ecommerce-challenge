//
//  L10n.swift
//  liverpool-challenge
//
//  Created by Carlos Vázquez Gómez on 3/10/18.
//  Copyright © 2018 Carlos Vázquez Gómez. All rights reserved.
//

import Foundation

class L10n {
    enum Key: String {
        case main_title
        case main_search_placeholder
    }
    
    static func string(for key: Key) -> String {
        return NSLocalizedString(key.rawValue, comment: "")
    }
}
