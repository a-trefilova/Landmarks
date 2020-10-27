

enum PlaceMap {
    // MARK: Use cases
    enum Something {
        struct Request {
        }

        struct Response {
            var result: PlaceMapRequestResult
        }

        struct ViewModel {
            var state: ViewControllerState
        }
    }

    enum PlaceMapRequestResult {
        case failure(PlaceMapError)
        case success(LandmarkModel)
    }

    enum ViewControllerState {
        case loading
        case result(LandmarkModel)
        case emptyResult
        case error(message: String)
    }

    enum PlaceMapError: Error {
        case someError(message: String)
    }
}

