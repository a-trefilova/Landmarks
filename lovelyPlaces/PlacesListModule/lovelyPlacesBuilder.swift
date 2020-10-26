//
//  lovelyPlacesBuilder.swift
//  lovelyPlaces
//
//  Created by Alyona Sabitskaya  on 22.10.2020.
//  Copyright © 2020 Alyona Sabitskaya . All rights reserved.
//

import UIKit


//in original arch this class is sublclass of some ModuleBuilder
class lovelyPlacesBuilder: ModuleBuilder {

    var initialState: lovelyPlaces.ViewControllerState?

    func set(initialState: lovelyPlaces.ViewControllerState) -> lovelyPlacesBuilder {
        self.initialState = initialState
        return self
    }

    func build() -> UIViewController {
        let presenter = lovelyPlacesPresenter()
        let interactor = lovelyPlacesInteractor(presenter: presenter)
        let controller = lovelyPlacesViewController(interactor: interactor)

        presenter.viewController = controller
        return controller
    }
}
