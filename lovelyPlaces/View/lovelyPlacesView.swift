//
//  lovelyPlacesView.swift
//  lovelyPlaces
//
//  Created by Alyona Sabitskaya  on 22.10.2020.
//  Copyright © 2020 Alyona Sabitskaya . All rights reserved.
//

import UIKit
import SnapKit

extension lovelyPlacesView {
    struct Appearance {
        let exampleOffset: CGFloat = 10
    }
}

class lovelyPlacesView: UIView {
    let appearance = Appearance()
    let dataSource = [lovelyPlacesModel]()
    var collectionView: UICollectionView?
    
    fileprivate(set) lazy var customView: UIView = {
        let view = UIView()
        return view
    }()

    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        
        
        // DOESNT WORK !!!
        
        //  collectionView = UICollectionView(frame: CGRect(x: 10, y: 20, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        
        self.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        addSubviews()
        makeConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addSubviews(){
        addSubview(customView)
    }

    func makeConstraints() {
    }
}



extension lovelyPlacesView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseId, for: indexPath)
        return cell
    }
    
    
}

class CustomCell: UICollectionViewCell {
    
    static let reuseId: String = "CustomCell"
    private let defaultPlaceModel = lovelyPlacesModel(id: 1, name: "LOEW", category: .featured, city: "OGANA", state: "Open", park: "Fl", coordinates: Coordinates(longitude: 0.1, latitude: 10.3), imageName: "None", isFavorite: true)
    var dataSourceItem: lovelyPlacesModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        dataSourceItem = defaultPlaceModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
