//
//  lovelyPlacesInteractor.swift
//  lovelyPlaces
//
//  Created by Alyona Sabitskaya  on 22.10.2020.
//  Copyright © 2020 Alyona Sabitskaya . All rights reserved.
//

protocol LandmarkListBusinessLogic {
    func doSomething(request: LandmarkList.Something.Request, isFav: Bool)
}

/// Класс для описания бизнес-логики модуля places
class LandmarkListInteractor: LandmarkListBusinessLogic {
    let presenter: LandmarkListPresentationLogic
    let provider: LandmarkListProviderProtocol

    init(presenter: LandmarkListPresentationLogic, provider: LandmarkListProviderProtocol = LandmarkListProvider()) {
        self.presenter = presenter
        self.provider = provider
    }
    
    // MARK: Do something
    func doSomething(request: LandmarkList.Something.Request, isFav: Bool) {
        provider.getItems { (items, error) in
            let result: LandmarkList.LandmarkListRequestResult
            if let items = items {
                if isFav {
                    var array = items
                    for item in array {
                        if item.isFavorite == false {
                            guard let index = array.firstIndex(of: item) else { return }
                            array.remove(at: index)
                        }
                    }
                    result = .success(array)
                } else {
                    result = .success(items)
                }
            } else if let error = error {
                result = .failure(.someError(message: error.localizedDescription))
            } else {
                result = .failure(.someError(message: "No Data"))
            }
            self.presenter.presentSomething(response: LandmarkList.Something.Response(result: result))
            
        }
    }
    
    
}

