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
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60)
        
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 20)
        label.numberOfLines = 1
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.text = "Favourites only"
        return label
    }()
    
    let switchSlider: CustomSwitch = {
        let switchSlider = CustomSwitch()
        switchSlider.setOn(false, animated: false)
        return switchSlider
    }()
    
   
    
    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        addSubviews()
        makeConstraints()
        switchSlider.addTarget(self, action: #selector(switchedOn), for: .valueChanged)
        
    }

    @objc func switchedOn() {
        switchSlider.sendState()
        print("ON!")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //DOESNT WORK
    func drawSeparators() {
        let frame = CGRect(x: 0, y: containerView.frame.size.height - 1, width: containerView.bounds.width, height: 1)
        let separatorView = UIView(frame: frame)
        separatorView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        containerView.addSubview(separatorView)
        separatorView.snp.makeConstraints { (make) in
            make.bottom.equalTo(containerView.snp.bottom)
            make.leading.equalTo(containerView.snp.leading)
            make.trailing.equalTo(containerView.snp.trailing)
        }
    }

    func addSubviews(){
        addSubview(tableView)
        //addSubview(containerView)
        
        tableView.tableHeaderView = containerView
        containerView.addSubview(titleLabel)
        containerView.addSubview(switchSlider)
        drawSeparators()
//        headerView.addSubview(titleLabel)
//        headerView.addSubview(switchSlider)
        
    }

    func makeConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            //make.bottom.equalToSuperview()
            make.height.equalTo(44)
            make.width.equalToSuperview()
           // make.centerX.equalToSuperview()
        }

        
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(containerView.snp.leading).offset(20)
            make.centerY.equalTo(containerView.snp.centerY)
            
        }

        switchSlider.snp.makeConstraints { (make) in
            make.trailing.equalTo(containerView.snp.trailing).offset(-20)
            make.centerY.equalTo(containerView.snp.centerY)
        }
        
        
    }
}


class CustomSwitch: UISwitch {
    var delegate: Switchdelegate?
    
    func sendState() {
        delegate?.switchDidChange(stateOfSwitch: self.isOn)
    }
}

protocol Switchdelegate {
    func switchDidChange(stateOfSwitch: Bool)
}
