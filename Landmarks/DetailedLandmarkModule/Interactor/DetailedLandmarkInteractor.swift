protocol DetailedLandmarkBusinessLogic {
    func getLandmarkData(request: DetailedLandmark.GetDetailsCase.Request)
}

class DetailedLandmarkInteractor: DetailedLandmarkBusinessLogic {
    let presenter: DetailedLandmarkPresentationLogic
    let provider: DetailedLandmarkProviderProtocol

    init(presenter: DetailedLandmarkPresentationLogic, provider: DetailedLandmarkProviderProtocol = DetailedLandmarkProvider()) {
        self.presenter = presenter
        self.provider = provider
    }
    
    func getLandmarkData(request: DetailedLandmark.GetDetailsCase.Request) {
        provider.getItems { (items, error) in
            let result: DetailedLandmark.DetailedLandmarkRequestResult
            if let items = items {
                result = .success(items)
            } else if let error = error {
                result = .failure(.someError(message: error.localizedDescription))
            } else {
                result = .failure(.someError(message: "No Data"))
            }
            self.presenter.presentLandmark(response: DetailedLandmark.GetDetailsCase.Response(result: result))
        }
    }
}

