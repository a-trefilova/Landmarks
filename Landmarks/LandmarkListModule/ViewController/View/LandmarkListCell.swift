import UIKit
import SnapKit

class LandmarkListCell: UITableViewCell {
    
    static let reuseId: String = "ListCell"
    
    private let cellContentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let heightForCell: CGFloat = 60
    private let heightForImage: CGFloat = 50
    
    private let imageContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
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
        return label.setFontAndSize(size: 20)
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        imageContainer.layer.cornerRadius = heightForImage / 2
        setUpSubViews()
        setUpConstraints()
    }
    
    
    func setState(viewModel: LandmarkModel) {
       let attributedString = NSMutableAttributedString()
        titleLabel.attributedText = attributedString.addStarToFavourite(string: viewModel.name, isFav: viewModel.isFavorite)
        placeImageView.image = UIImage(named: viewModel.imageName)
        
        layoutIfNeeded()
    }
    
    
    private func setUpSubViews() {
        contentView.addSubview(cellContentView)
        cellContentView.addSubview(titleLabel)
        cellContentView.addSubview(imageContainer)
        imageContainer.addSubview(placeImageView)
    }
    
    private func setUpConstraints() {
        cellContentView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(heightForCell)
        }
        
        imageContainer.snp.makeConstraints { (make) in
            make.centerY.equalTo(cellContentView.snp.centerY)
            make.leading.equalTo(cellContentView.snp.leading).inset(20)
            make.height.equalTo(heightForImage)
            make.width.equalTo(heightForImage)
        }
        
        placeImageView.snp.makeConstraints { (make) in
            make.top.equalTo(imageContainer.snp.top)
             make.bottom.equalTo(imageContainer.snp.bottom)
             make.leading.equalTo(imageContainer.snp.leading)
             make.trailing.equalTo(imageContainer.snp.trailing)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(imageContainer.snp.trailing).inset(-20)
            make.centerY.equalTo(cellContentView.snp.centerY)
        }
        
    
        
    }
    
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


