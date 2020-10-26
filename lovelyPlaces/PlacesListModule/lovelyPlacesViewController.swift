//
//  lovelyPlacesViewController.swift
//  lovelyPlaces
//
//  Created by Alyona Sabitskaya  on 22.10.2020.
//  Copyright © 2020 Alyona Sabitskaya . All rights reserved.
//

import UIKit

protocol lovelyPlacesDisplayLogic: class {
    func displaySomething(viewModel: lovelyPlaces.Something.ViewModel)
}

class lovelyPlacesViewController: UIViewController {
    let interactor: lovelyPlacesBusinessLogic
    var state: lovelyPlaces.ViewControllerState
    
    private var rootView: lovelyPlacesView? {
        return view as? lovelyPlacesView
    }
    
    
    
    init(interactor: lovelyPlacesBusinessLogic, initialState: lovelyPlaces.ViewControllerState = .loading) {
        self.interactor = interactor
        self.state = initialState
        super.init(nibName: nil, bundle: nil)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    // MARK: View lifecycle
    override func loadView() {
       view = lovelyPlacesView(frame: UIScreen.main.bounds)
        // make additional setup of view or save references to subviews
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = "Landmarks"
        rootView?.tableView.register(ListCell.self, forCellReuseIdentifier: ListCell.reuseId)
        rootView?.tableView.dataSource = self
        rootView?.tableView.delegate = self
        doSomething()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    

    // MARK: Do something
    func doSomething() {
        let request = lovelyPlaces.Something.Request()
        interactor.doSomething(request: request, isFav: rootView!.observer.isOn)
       
    }
    
    
}

extension lovelyPlacesViewController: lovelyPlacesDisplayLogic {
    func displaySomething(viewModel: lovelyPlaces.Something.ViewModel) {
        display(newState: viewModel.state)
    }

    func display(newState: lovelyPlaces.ViewControllerState) {
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

extension lovelyPlacesViewController: UITableViewDataSource, UITableViewDelegate {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.reuseId, for: indexPath)
        
        if let placeCell = cell as? ListCell {
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
        let router = Router(builder: PlaceMapBuilder())
        
       
        //datastore.models
        
        switch state {
       
        case .loading:
            print("")
        case .result(let viewModel):
//
//            navigationController?.pushViewController(router.presentViewController(), animated: true)
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

