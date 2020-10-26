import UIKit
import SnapKit

class ListCell: UITableViewCell {
    
    static let reuseId: String = "ListCell"
    
    private let cellContentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let placeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Apple SD Gothic Neo Bold", size: 20)
        return label
    }()
    
   
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        placeImageView.layer.cornerRadius = 30
        setUpSubViews()
        setUpConstraints()
    }
    
    
    func setState(viewModel: lovelyPlacesModel) {

        titleLabel.text = viewModel.name
        imageView?.image = UIImage(named: viewModel.imageName)
    }
    
    
    private func setUpSubViews() {
        contentView.addSubview(cellContentView)
        cellContentView.addSubview(titleLabel)
        cellContentView.addSubview(placeImageView)
    }
    
    private func setUpConstraints() {
        cellContentView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        
        placeImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().multipliedBy(5)
            make.bottom.equalToSuperview().multipliedBy(5)
            make.left.equalToSuperview().multipliedBy(20)
            //make.centerY.equalToSuperview()
            guard let view = superview else { return }
            make.height.equalTo(view.snp.height)
            make.width.equalTo(view.snp.height)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(placeImageView.snp.trailing).inset(-80)
            make.centerY.equalTo(cellContentView.snp.centerY)
        }
        
    
        
    }
    
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
