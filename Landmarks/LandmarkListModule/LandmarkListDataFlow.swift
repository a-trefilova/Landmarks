
enum LandmarkList {
    // MARK: Use cases
    enum GetListCase {
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

