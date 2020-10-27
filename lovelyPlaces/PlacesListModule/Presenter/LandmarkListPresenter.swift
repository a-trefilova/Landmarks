//
//  lovelyPlacesPresenter.swift
//  lovelyPlaces
//
//  Created by Alyona Sabitskaya  on 22.10.2020.
//  Copyright © 2020 Alyona Sabitskaya . All rights reserved.
//

import UIKit

protocol LandmarkListPresentationLogic {
    func presentSomething(response: LandmarkList.Something.Response)
}

/// Отвечает за отображение данных модуля lovelyPlaces
class LandmarkListPresenter: LandmarkListPresentationLogic {
    weak var viewController: LandmarkListDisplayLogic?

    // MARK: Do something
    func presentSomething(response: LandmarkList.Something.Response) {
        var viewModel: LandmarkList.Something.ViewModel
        
        switch response.result {
        case let .failure(error):
            viewModel = LandmarkList.Something.ViewModel(state: .error(message: error.localizedDescription))
        case let .success(result):
            if result.isEmpty {
                viewModel = LandmarkList.Something.ViewModel(state: .emptyResult)
            } else {
                viewModel = LandmarkList.Something.ViewModel(state: .result(result))
            }
        }
        
        viewController?.displaySomething(viewModel: viewModel)
    }
 
}

