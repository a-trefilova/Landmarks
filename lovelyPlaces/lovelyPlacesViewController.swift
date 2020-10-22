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
        let view = lovelyPlacesView(frame: UIScreen.main.bounds)
        self.view = view
        // make additional setup of view or save references to subviews
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }

    // MARK: Do something
    func doSomething() {
        let request = lovelyPlaces.Something.Request()
        interactor.doSomething(request: request)
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
            //UPDATE VIEW 
            print("result: \(items)")
        case .emptyResult:
            print("empty result")
        }
    }
}
