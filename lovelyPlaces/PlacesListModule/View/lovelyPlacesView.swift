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
    var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero,
                                    style: .plain)
        tableView.separatorInset = .init(top: 0, left: 20, bottom: 0, right: 0)
        return tableView
    } ()
    
    let headerView: UITableViewHeaderFooterView = {
        let header = UITableViewHeaderFooterView()
        header.textLabel?.text = "Favourites only"
        header.textLabel?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return header
    }()
    
    let switchSlider: UISwitch = {
        let switchSlider = UISwitch()
        switchSlider.setOn(false, animated: false)
        return switchSlider
    }()

    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        tableView.tableHeaderView = headerView
        self.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        addSubviews()
        makeConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addSubviews(){
        addSubview(tableView)
        
        tableView.tableHeaderView?.addSubview(switchSlider)
    }

    func makeConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        switchSlider.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview()
        }
        
        
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
