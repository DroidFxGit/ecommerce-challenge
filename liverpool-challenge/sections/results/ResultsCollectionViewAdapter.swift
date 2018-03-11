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
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        configureAdapter()
        configureItemsLayout()
    }
    
    fileprivate func configureAdapter() {
        collectionView?.delegate = self
        collectionView?.dataSource = self
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
        return CGSize(width: 174, height: 178)
    }
}

extension ResultsCollectionViewAdapter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionIdentifier", for: indexPath) as! CollectionItemViewCell
        return collectionsCell
    }
}
