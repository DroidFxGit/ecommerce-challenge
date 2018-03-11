//
//  CollectionItemViewCell.swift
//  liverpool-challenge
//
//  Created by Carlos Vázquez Gómez on 3/10/18.
//  Copyright © 2018 Carlos Vázquez Gómez. All rights reserved.
//

import UIKit
import Imaginary

class CollectionItemViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var displayName: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func configure(_ product: Product) {
        displayName.text = product.displayName
        priceLabel.text = "$" + (product.mainPrice)!
        
        let url = URL(string: product.imageUrl!)
        imageView.setImage(url: url!, placeholder: UIImage(named: "placeholder"))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
