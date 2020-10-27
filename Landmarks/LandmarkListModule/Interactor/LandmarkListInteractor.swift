
protocol LandmarkListBusinessLogic {
    func getListOfLandmarks(request: LandmarkList.GetListCase.Request, isFav: Bool)
}

class LandmarkListInteractor: LandmarkListBusinessLogic {
    let presenter: LandmarkListPresentationLogic
    let provider: LandmarkListProviderProtocol

    init(presenter: LandmarkListPresentationLogic, provider: LandmarkListProviderProtocol = LandmarkListProvider()) {
        self.presenter = presenter
        self.provider = provider
    }
    
    func getListOfLandmarks(request: LandmarkList.GetListCase.Request, isFav: Bool) {
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
            self.presenter.presentListOfLandmarks(response: LandmarkList.GetListCase.Response(result: result))
            
        }
    }
    
    
}

