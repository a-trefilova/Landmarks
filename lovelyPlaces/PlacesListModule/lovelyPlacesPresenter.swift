//
//  lovelyPlacesPresenter.swift
//  lovelyPlaces
//
//  Created by Alyona Sabitskaya  on 22.10.2020.
//  Copyright © 2020 Alyona Sabitskaya . All rights reserved.
//

import UIKit

protocol lovelyPlacesPresentationLogic {
    func presentSomething(response: lovelyPlaces.Something.Response)
}

/// Отвечает за отображение данных модуля lovelyPlaces
class lovelyPlacesPresenter: lovelyPlacesPresentationLogic {
    weak var viewController: lovelyPlacesDisplayLogic?

    // MARK: Do something
    func presentSomething(response: lovelyPlaces.Something.Response) {
        var viewModel: lovelyPlaces.Something.ViewModel
        
        switch response.result {
        case let .failure(error):
            viewModel = lovelyPlaces.Something.ViewModel(state: .error(message: error.localizedDescription))
        case let .success(result):
            if result.isEmpty {
                viewModel = lovelyPlaces.Something.ViewModel(state: .emptyResult)
            } else {
                viewModel = lovelyPlaces.Something.ViewModel(state: .result(result))
            }
        }
        
        viewController?.displaySomething(viewModel: viewModel)
    }
    
//    func presentFavs(response: lovelyPlaces.Something.Response) {
//        var viewModel: lovelyPlaces.Something.ViewModel
//        
//        switch response.result {
//        case let .failure(error):
//            viewModel = lovelyPlaces.Something.ViewModel(state: .error(message: error.localizedDescription))
//        case let .success(result):
//            if result.isEmpty {
//                viewModel = lovelyPlaces.Something.ViewModel(state: .emptyResult)
//            } else {
//                viewModel = lovelyPlaces.Something.ViewModel(state: .result(result))
//            }
//        }
//        
//        viewController?.displaySomething(viewModel: viewModel)
//    }
}

