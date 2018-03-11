//
//  ResultsCollectionViewAdapter.swift
//  liverpool-challenge
//
//  Created by Carlos Vázquez Gómez on 3/10/18.
//  Copyright © 2018 Carlos Vázquez Gómez. All rights reserved.
//

import UIKit

class ResultsCollectionViewAdapter: NSObject {
    
    var collectionView: UICollectionView?
    var products: [Product]?
    
    init(collectionView: UICollectionView, products: [Product]) {
        self.collectionView = collectionView
        self.products = products
        super.init()
        configureAdapter()
        configureItemsLayout()
    }
    
    fileprivate func configureAdapter() {
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = Color.Theme.background
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(UINib(nibName: "CollectionItemViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionIdentifier")
    }
    
    fileprivate func configureItemsLayout() {
        let layout = FavoritesCollectionViewFlowLayout(collection: collectionView!)
        collectionView!.collectionViewLayout = layout
    }
}

extension ResultsCollectionViewAdapter: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sizeOfCell = ((self.collectionView?.frame.width)! / 2) - 30
        return CGSize(width: sizeOfCell, height: sizeOfCell + 50)
    }
}

extension ResultsCollectionViewAdapter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (products?.count)!
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        let product = products![index]
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionIdentifier", for: indexPath) as! CollectionItemViewCell
        collectionCell.configure(product)
        return collectionCell
    }
}
