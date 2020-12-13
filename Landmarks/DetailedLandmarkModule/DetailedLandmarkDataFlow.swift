

enum DetailedLandmark {
    enum GetDetailsCase {
        struct Request {
        }

        struct Response {
            var result: DetailedLandmarkRequestResult
        }

        struct ViewModel {
            var state: ViewControllerState
        }
    }

    enum DetailedLandmarkRequestResult {
        case failure(DetailedLandmarkError)
        case success(LandmarkModel)
    }

    enum ViewControllerState {
        case loading
        case result(LandmarkModel)
        case emptyResult
        case error(message: String)
    }

    enum DetailedLandmarkError: Error {
        case someError(message: String)
    }
}

