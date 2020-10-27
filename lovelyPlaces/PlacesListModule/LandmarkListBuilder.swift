//
//  lovelyPlacesBuilder.swift
//  lovelyPlaces
//
//  Created by Alyona Sabitskaya  on 22.10.2020.
//  Copyright © 2020 Alyona Sabitskaya . All rights reserved.
//

import UIKit


//in original arch this class is sublclass of some ModuleBuilder
class LandmarkListBuilder: ModuleBuilder {

    var initialState: LandmarkList.ViewControllerState?

    func set(initialState: LandmarkList.ViewControllerState) -> LandmarkListBuilder {
        self.initialState = initialState
        return self
    }

    func build() -> UIViewController {
        let presenter = LandmarkListPresenter()
        let interactor = LandmarkListInteractor(presenter: presenter)
        let controller = LandmarkListViewController(interactor: interactor)

        presenter.viewController = controller
        return controller
    }
}
