//
//  ThemeManager.swift
//  liverpool-challenge
//
//  Created by Carlos Vázquez Gómez on 3/10/18.
//  Copyright © 2018 Carlos Vázquez Gómez. All rights reserved.
//

import Foundation
import UIKit

struct Font
{
    static let Helvetica = UIFont(name: "Helvetica", size: 20)
    static let HelveticaLight = UIFont(name: "Helvetica-Light", size: 16)
    
    struct NavigationBar {
        static let Title = Helvetica
    }
}


struct ThemeManager {
    
    static func applyTheme() {
        let navigationBar = UINavigationBar.appearance()
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = Color.Theme.normal
        navigationBar.tintColor = UIColor.white
        navigationBar.titleTextAttributes = navigationBarAttributes()
        
        let toolBar = UIToolbar.appearance()
        toolBar.tintColor = Color.Theme.normal
        
        UITextField.appearance(whenContainedInInstancesOf:[UISearchBar.self]).tintColor = .white
    }
    
    static fileprivate func navigationBarAttributes() -> [NSAttributedStringKey: AnyObject] {
        let color = UIColor.white
        let font = Font.NavigationBar.Title
        return [NSAttributedStringKey.font: font!, NSAttributedStringKey.foregroundColor: color]
    }
    
}

extension UISearchBar {
    func setDefaultSearchBar() {
        self.tintColor = .white
        self.searchBarStyle = .minimal
        self.placeholder = L10n.string(for: .main_search_placeholder)
    }
}
