import UIKit
import SnapKit
import MapKit

extension PlaceMapView {
    struct Appearance {
        let exampleOffset: CGFloat = 10
    }
}

class PlaceMapView: UIView {
    let appearance = Appearance()

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
        view.translatesAutoresizingMaskIntoConstraints = false
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
        label.font = UIFont(name: "Lao Sangam MN", size: 27)
        label.numberOfLines = 1
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    var descripionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Lao Sangam MN", size: 13)
        label.numberOfLines = 1
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    var stateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Lao Sangam MN", size: 13)
        label.numberOfLines = 1
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
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
        screenContainerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        
        
        mapContainer.snp.makeConstraints { (make) in
            make.top.equalTo(screenContainerView)
            make.leading.equalTo(screenContainerView)
            make.trailing.equalTo(screenContainerView)
            make.bottom.equalTo(screenContainerView.snp.centerY)
        }
        
        mapView.snp.makeConstraints { (make) in
            make.edges.equalTo(mapContainer)
        }
        
        labelContainer.snp.makeConstraints { (make) in
            make.leading.equalTo(mapContainer.snp.leading).offset(20)
            make.top.equalTo(mapContainer.snp.bottom).offset(100)
            make.trailing.equalTo(mapContainer.snp.trailing).offset(-10)
            //make.bottom.lessThanOrEqualTo(screenContainerView.snp.bottom).offset(-200)
            
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
            //make.bottom.equalTo(labelContainer.snp.bottom)
            make.top.equalTo(labelContainer.snp.top).offset(20)
            
        }
        
        imageContainer.snp.makeConstraints { (make) in
            make.centerX.equalTo(screenContainerView.snp.centerX)
            make.centerY.equalTo(mapContainer.snp.bottom)
            make.width.equalTo(150)
            make.height.equalTo(150)
              }
        
        landmarkImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(imageContainer)
        }
        
    }
    
    func setState(state: lovelyPlacesModel) {
        mapView.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: state.coordinates.latitude, longitude: state.coordinates.longitude), latitudinalMeters: 5000, longitudinalMeters: 5000), animated: false)
        landmarkImageView.image = UIImage(named: state.imageName)
        titleLabel.text = state.name
        descripionLabel.text = state.park
    }
}

