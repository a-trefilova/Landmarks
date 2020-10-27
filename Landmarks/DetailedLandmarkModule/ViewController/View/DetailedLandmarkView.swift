import UIKit
import SnapKit
import MapKit

extension DetailedLandmarkView {
    struct Appearance {
        let exampleOffset: CGFloat = 10
    }
}

class DetailedLandmarkView: UIView {
    let appearance = Appearance()
    private let coefficientOfMultyply: CGFloat = 0.6
    private var landmarkImageWidth: CGFloat!
    var screenContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var mapContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var mapView: MKMapView = {
        let view = MKMapView()
        view.clipsToBounds = true
        view.isUserInteractionEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var imageContainer: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 10
        view.layer.shadowOffset = .zero
        return view
    }()
    
    var landmarkImageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var labelContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        return label.setFontAndSize(size: 27)
    }()
    
    var descripionLabel: UILabel = {
        let label = UILabel()
        return label.setFontAndSize(size: 13)
    }()
    
    var stateLabel: UILabel = {
        let label = UILabel()
        return label.setFontAndSize(size: 13)
    }()
    
    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        landmarkImageWidth = UIScreen.main.bounds.width * coefficientOfMultyply
        landmarkImageView.layer.cornerRadius = landmarkImageWidth / 2
        imageContainer.layer.cornerRadius = landmarkImageWidth / 2
        landmarkImageView.drawBorder()
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        addSubviews()
        makeConstraints()
    }
    
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addSubviews(){
        addSubview(screenContainerView)
        screenContainerView.addSubview(mapContainer)
        screenContainerView.addSubview(imageContainer)
        screenContainerView.addSubview(labelContainer)
        
        mapContainer.addSubview(mapView)
        
        mapView.bringSubviewToFront(mapContainer)
        
        imageContainer.addSubview(landmarkImageView)
        
        labelContainer.addSubview(titleLabel)
        labelContainer.addSubview(descripionLabel)
        labelContainer.addSubview(stateLabel)
    }

    func makeConstraints() {
        //CNSTRNTS OF MAIN VIEW
        screenContainerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        
        //CNSTRNTS OF MAP
        mapContainer.snp.makeConstraints { (make) in
            make.top.equalTo(screenContainerView)
            make.leading.equalTo(screenContainerView)
            make.trailing.equalTo(screenContainerView)
            make.bottom.equalTo(screenContainerView.snp.centerY).offset(-75)
        }
        
        mapView.snp.makeConstraints { (make) in
            make.edges.equalTo(mapContainer)
        }
        
        
        //CNSTRNTS OF LABELS
        labelContainer.snp.makeConstraints { (make) in
            make.leading.equalTo(mapContainer.snp.leading).offset(20)
            make.top.equalTo(imageContainer.snp.bottom).offset(20)
            make.trailing.equalTo(mapContainer.snp.trailing).offset(-10)
            
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(labelContainer.snp.leading)
            make.top.equalTo(labelContainer.snp.top)
        }
        
        descripionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalTo(labelContainer.snp.leading)
            make.bottom.equalTo(labelContainer.snp.bottom)
        }
        
        stateLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(labelContainer.snp.trailing)
            make.bottom.equalTo(labelContainer.snp.bottom)
            //make.top.equalTo(labelContainer.snp.top).offset(20)
            //make.leading.equalTo(descripionLabel.snp.trailing)
        }
        
        //CNSTRNTS OF IMAGE
        imageContainer.snp.makeConstraints { (make) in
            make.centerX.equalTo(screenContainerView.snp.centerX)
            make.centerY.equalTo(mapContainer.snp.bottom)
            make.width.equalTo(mapContainer.snp.width).multipliedBy(0.6)
            make.height.equalTo(mapContainer.snp.width).multipliedBy(0.6)
            
        }
        
        landmarkImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(imageContainer)
        }
        
    }
    
    func setState(state: LandmarkModel) {
        mapView.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: state.coordinates.latitude, longitude: state.coordinates.longitude), latitudinalMeters: 5000, longitudinalMeters: 5000), animated: false)
        landmarkImageView.image = UIImage(named: state.imageName)
        
        
        
        
        let attrString = NSMutableAttributedString()
        titleLabel.attributedText = attrString.addStarToFavourite(string: state.name, isFav: state.isFavorite)
        descripionLabel.text = state.park
        stateLabel.text = state.state
        layoutIfNeeded()
    }
}



