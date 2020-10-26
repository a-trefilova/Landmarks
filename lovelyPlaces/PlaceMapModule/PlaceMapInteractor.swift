protocol PlaceMapBusinessLogic {
    func doSomething(request: PlaceMap.Something.Request)
}

/// Класс для описания бизнес-логики модуля places
class PlaceMapInteractor: PlaceMapBusinessLogic {
    let presenter: PlaceMapPresentationLogic
    let provider: PlaceMapProviderProtocol

    init(presenter: PlaceMapPresentationLogic, provider: PlaceMapProviderProtocol = PlaceMapProvider()) {
        self.presenter = presenter
        self.provider = provider
    }
    
    // MARK: Do something
    func doSomething(request: PlaceMap.Something.Request) {
        provider.getItems { (items, error) in
            let result: PlaceMap.PlaceMapRequestResult
            if let items = items {
                result = .success(items)
            } else if let error = error {
                result = .failure(.someError(message: error.localizedDescription))
            } else {
                result = .failure(.someError(message: "No Data"))
            }
            self.presenter.presentSomething(response: PlaceMap.Something.Response(result: result))
        }
    }
}

