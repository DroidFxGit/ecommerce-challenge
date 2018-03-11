//
//  ViewControllerProtocol.swift
//  liverpool-challenge
//
//  Created by Carlos Vázquez Gómez on 3/10/18.
//  Copyright © 2018 Carlos Vázquez Gómez. All rights reserved.
//

import UIKit
import PKHUD

protocol ViewControllerProtocol: class {
    var presenterView: UIView? { get }
    var collection: UICollectionView? { get }
}

extension ViewControllerProtocol where Self: UIViewController {
    
    func showProgressHUD() {
        collection?.isHidden = true
        HUD.show(.progress, onView: presenterView)
    }
    
    func finishLoadingHUD(_ type: HUDContentType) {
        collection?.isHidden = false
        HUD.flash(type, onView: presenterView)
    }
}
