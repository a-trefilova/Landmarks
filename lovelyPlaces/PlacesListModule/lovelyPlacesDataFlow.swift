//
//  lovelyPlacesDataFlow.swift
//  lovelyPlaces
//
//  Created by Alyona Sabitskaya  on 22.10.2020.
//  Copyright © 2020 Alyona Sabitskaya . All rights reserved.
//

enum lovelyPlaces {
    // MARK: Use cases
    enum Something {
        struct Request {
        }

        struct Response {
            var result: lovelyPlacesRequestResult
        }

        struct ViewModel {
            var state: ViewControllerState
        }
    }

    enum lovelyPlacesRequestResult {
        case failure(lovelyPlacesError)
        case success([lovelyPlacesModel])
    }

    enum ViewControllerState {
        case loading
        case result([lovelyPlacesModel])
        case emptyResult
        case error(message: String)
    }

    enum lovelyPlacesError: Error {
        case someError(message: String)
    }
}

