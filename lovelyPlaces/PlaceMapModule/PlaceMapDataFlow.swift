

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
        case success(lovelyPlacesModel)
    }

    enum ViewControllerState {
        case loading
        case result(lovelyPlacesModel)
        case emptyResult
        case error(message: String)
    }

    enum PlaceMapError: Error {
        case someError(message: String)
    }
}

