import UIKit

protocol PlaceMapDisplayLogic: class {
    func displaySomething(viewModel: PlaceMap.Something.ViewModel)
}

class PlaceMapViewController: UIViewController {
    let interactor: PlaceMapBusinessLogic
    var state: PlaceMap.ViewControllerState
    private var rootView: PlaceMapView? {
        return view as? PlaceMapView
    }
    
    
    init(interactor: PlaceMapBusinessLogic, initialState: PlaceMap.ViewControllerState = .loading) {
        self.interactor = interactor
        self.state = initialState
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View lifecycle
    override func loadView() {
        view = PlaceMapView(frame: UIScreen.main.bounds)
        self.view = view
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }

    // MARK: Do something
    func doSomething() {
        let request = PlaceMap.Something.Request()
        interactor.doSomething(request: request)
    }
}

extension PlaceMapViewController: PlaceMapDisplayLogic {
    func displaySomething(viewModel: PlaceMap.Something.ViewModel) {
        display(newState: viewModel.state)
    }

    func display(newState: PlaceMap.ViewControllerState) {
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
