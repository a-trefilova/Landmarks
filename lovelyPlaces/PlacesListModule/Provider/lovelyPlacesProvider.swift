//
//  lovelyPlacesProvider.swift
//  lovelyPlaces
//
//  Created by Alyona Sabitskaya  on 22.10.2020.
//  Copyright © 2020 Alyona Sabitskaya . All rights reserved.
//

protocol lovelyPlacesProviderProtocol {
    func getItems(completion: @escaping ([lovelyPlacesModel]?, lovelyPlacesProviderError?) -> Void)
}

enum lovelyPlacesProviderError: Error {
    case getItemsFailed(underlyingError: Error)
}

/// Отвечает за получение данных модуля lovelyPlaces
struct lovelyPlacesProvider: lovelyPlacesProviderProtocol {
    let dataStore: lovelyPlacesDataStore
    let service: lovelyPlacesServiceProtocol

    init(dataStore: lovelyPlacesDataStore = lovelyPlacesDataStore(), service: lovelyPlacesServiceProtocol = lovelyPlacesService()) {
        self.dataStore = dataStore
        self.service = service
    }

    func getItems(completion: @escaping ([lovelyPlacesModel]?, lovelyPlacesProviderError?) -> Void) {
        if dataStore.models?.isEmpty == false {
            return completion(self.dataStore.models, nil)
        }
        service.fetchItems { (array, error) in
            if let error = error {
                completion(nil, .getItemsFailed(underlyingError: error))
            } else if let models = array {
                self.dataStore.models = models
                completion(self.dataStore.models, nil)
            }
        }
    }
}

