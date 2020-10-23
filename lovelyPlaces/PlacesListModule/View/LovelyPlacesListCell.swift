import UIKit
import SnapKit

class ListCell: UITableViewCell {
    
    static let reuseId: String = "ListCell"
    
    private let placeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = imageView.bounds.height / 2
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
        setUpSubViews()
        setUpConstraints()
    }
    
    
    func setState(/*state: lovelyPlaces.ViewControllerState,*/ viewModel: lovelyPlacesModel) {
//        switch state {
//
//        case .loading:
//            print("loading")
//        case .result(let model):
//            titleLabel.text = model.first?.name
//        case .emptyResult:
//            print("result is empty")
//        case .error(message: let message):
//            print("error: \(message)")
//        }
        
        titleLabel.text = viewModel.name
        imageView?.image = UIImage(named: viewModel.imageName)
    }
    
    
    private func setUpSubViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(placeImageView)
    }
    
    private func setUpConstraints() {
//        self.snp.makeConstraints { (make) in
//            make.height.equalTo(80)
//        }
        placeImageView.snp.makeConstraints { (make) in
            make.top.equalTo(5)
            make.bottom.equalTo(5)
            make.left.equalTo(20)
            //make.centerY.equalToSuperview()
            guard let view = superview else { return }
            make.height.equalTo(view.snp.height)
            make.width.equalTo(view.snp.height)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(placeImageView.snp.right).offset(15)
            guard let view = superview else { return }
            make.top.equalTo(view).offset(60)
            make.bottom.equalTo(view).offset(60)
            //make.bottom.equalTo(40)
        }
        
    
        
    }
    
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
