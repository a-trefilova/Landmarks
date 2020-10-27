import UIKit

protocol DetailedLandmarkLogic: class {
    func displayLandmark(viewModel: DetailedLandmark.GetDetailsCase.ViewModel)
}

class DetailedLandmarkViewController: UIViewController {
    let interactor: DetailedLandmarkBusinessLogic
    var state: DetailedLandmark.ViewControllerState
    private var rootView: DetailedLandmarkView? {
        return view as? DetailedLandmarkView
    }
    
    
    init(interactor: DetailedLandmarkBusinessLogic, initialState: DetailedLandmark.ViewControllerState = .loading) {
        self.interactor = interactor
        self.state = initialState
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View lifecycle
    override func loadView() {
        view = DetailedLandmarkView(frame: UIScreen.main.bounds)
        self.view = view
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getLandmarkData()
    }

    func getLandmarkData() {
        let request = DetailedLandmark.GetDetailsCase.Request()
        interactor.getLandmarkData(request: request)
    }
}

extension DetailedLandmarkViewController: DetailedLandmarkLogic {
    func displayLandmark(viewModel: DetailedLandmark.GetDetailsCase.ViewModel) {
        display(newState: viewModel.state)
    }

    func display(newState: DetailedLandmark.ViewControllerState) {
        state = newState
        switch state {
        case .loading:
            print("loading...")
        case let .error(message):
            print("error \(message)")
        case let .result(items):
            navigationController?.navigationBar.prefersLargeTitles = false
            navigationController?.navigationBar.isHidden = false
            title = items.name
            rootView?.setState(state: items)
        case .emptyResult:
            print("empty result")
        }
    }
}
