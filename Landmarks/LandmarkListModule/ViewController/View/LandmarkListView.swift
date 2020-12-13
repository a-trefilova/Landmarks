
import UIKit
import SnapKit

class LandmarkListView: UIView {
    var landmarkListTableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero,
                                    style: .plain)
        tableView.separatorInset = .init(top: 0, left: 20, bottom: 0, right: 0)
        
        return tableView
    } ()
    
    private let headerContainer: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60)
        
        return view
    }()
    
    private let favouritesOnlyLabel: UILabel = {
        let label = UILabel()
        label.text = "Favourites only"
        return label.setFontAndSize(size: 20)
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func addSubviews(){
        addSubview(landmarkListTableView)

        landmarkListTableView.tableHeaderView = headerContainer
        
        headerContainer.addSubview(favouritesOnlyLabel)
        headerContainer.addSubview(switchSlider)
        
    }

    private func makeConstraints() {
        landmarkListTableView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        headerContainer.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(44)
            make.width.equalToSuperview()
        }

        
        favouritesOnlyLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(headerContainer.snp.leading).offset(20)
            make.centerY.equalTo(headerContainer.snp.centerY)
            
        }

        switchSlider.snp.makeConstraints { (make) in
            make.trailing.equalTo(headerContainer.snp.trailing).offset(-20)
            make.centerY.equalTo(headerContainer.snp.centerY)
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
