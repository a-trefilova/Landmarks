
import UIKit

protocol LandmarkListDisplayLogic: class {
    func displaySomething(viewModel: LandmarkList.Something.ViewModel)
}

class LandmarkListViewController: UIViewController {
    let interactor: LandmarkListBusinessLogic
    var state: LandmarkList.ViewControllerState
    
    private var rootView: LandmarkListView? {
        return view as? LandmarkListView
    }
    
    
    
    init(interactor: LandmarkListBusinessLogic, initialState: LandmarkList.ViewControllerState = .loading) {
        self.interactor = interactor
        self.state = initialState
        super.init(nibName: nil, bundle: nil)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    // MARK: View lifecycle
    override func loadView() {
       view = LandmarkListView(frame: UIScreen.main.bounds)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = "Landmarks"
        rootView?.tableView.register(LandmarkListCell.self, forCellReuseIdentifier: LandmarkListCell.reuseId)
        rootView?.tableView.dataSource = self
        rootView?.tableView.delegate = self
        rootView?.switchSlider.delegate = self
        doSomething()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    

    // MARK: Do something
    func doSomething() {
        let request = LandmarkList.Something.Request()
        interactor.doSomething(request: request, isFav: false)
       
    }
    
    
}

extension LandmarkListViewController: Switchdelegate {
    func switchDidChange(stateOfSwitch: Bool) {
        let request = LandmarkList.Something.Request()
        interactor.doSomething(request: request, isFav: stateOfSwitch)
    }
    
    
}

extension LandmarkListViewController: LandmarkListDisplayLogic {
    func displaySomething(viewModel: LandmarkList.Something.ViewModel) {
        display(newState: viewModel.state)
    }

    func display(newState: LandmarkList.ViewControllerState) {
        state = newState
        switch state {
        case .loading:
            print("loading...")
        case let .error(message):
            print("error \(message)")
        case let .result(items):
            rootView?.tableView.reloadData()
            print("result: \(items)")
        case .emptyResult:
            print("empty result")
        }
    }
}

extension LandmarkListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch state {
            case .loading:
                return 0
            case .result(let viewModel):
                return viewModel.count
            case .emptyResult:
                return 0
            case .error(message: let message):
                //PRESENT ALERT CONTROLLER WITH MESSAGE
                return 0
            }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LandmarkListCell.reuseId, for: indexPath)
        
        if let placeCell = cell as? LandmarkListCell {
            switch state {
            case .loading:
                print("")
            case .result(let viewModel):
                placeCell.setState(viewModel: viewModel[indexPath.row])
            case .emptyResult:
                print("")
            case .error(message: let message):
                print("")
            }
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch state {
        case .loading:
            print("")
        case .result(let viewModel):
            var datastore = PlaceMapDataStore()
            datastore.models = viewModel[indexPath.row]
            let presenter = PlaceMapPresenter()
            let provider = PlaceMapProvider(dataStore: datastore)
            let interactor = PlaceMapInteractor(presenter: presenter, provider: provider)
            let controller = PlaceMapViewController(interactor: interactor)
            presenter.viewController = controller
            navigationController?.pushViewController(controller, animated: true)
            
        case .emptyResult:
            print("")
        case .error(message: let message):
            print("")
        }
    }
}

