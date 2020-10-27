//
//  lovelyPlacesDataFlow.swift
//  lovelyPlaces
//
//  Created by Alyona Sabitskaya  on 22.10.2020.
//  Copyright © 2020 Alyona Sabitskaya . All rights reserved.
//

enum LandmarkList {
    // MARK: Use cases
    enum Something {
        struct Request {
        }

        struct Response {
            var result: LandmarkListRequestResult
        }

        struct ViewModel {
            var state: ViewControllerState
        }
    }

    enum LandmarkListRequestResult {
        case failure(LandmarkListError)
        case success([LandmarkModel])
    }

    enum ViewControllerState {
        case loading
        case result([LandmarkModel])
        case emptyResult
        case error(message: String)
    }

    enum LandmarkListError: Error {
        case someError(message: String)
    }
}

