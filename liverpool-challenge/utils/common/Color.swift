//
//  Color.swift
//  liverpool-challenge
//
//  Created by Carlos Vázquez Gómez on 3/10/18.
//  Copyright © 2018 Carlos Vázquez Gómez. All rights reserved.
//

import UIKit

struct Color {
    struct Theme {
        static var dark: UIColor { return UIColor(red: 200, green: 0, blue: 135) }
        static var normal: UIColor { return UIColor(red: 225, green: 0, blue: 152) }
        static var background: UIColor { return UIColor(red: 248, green: 248, blue: 248) }
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: 1.0)
    }
}
