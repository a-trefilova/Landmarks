
protocol LandmarkListProviderProtocol {
    func getItems(completion: @escaping ([LandmarkModel]?, LandmarkListProviderError?) -> Void)
}

enum LandmarkListProviderError: Error {
    case getItemsFailed(underlyingError: Error)
}


struct LandmarkListProvider: LandmarkListProviderProtocol {
    let dataStore: LandmarkDataStore
    let service: LandmarkListServiceProtocol

    init(dataStore: LandmarkDataStore = LandmarkDataStore(), service: LandmarkListServiceProtocol = LandmarkListService()) {
        self.dataStore = dataStore
        self.service = service
    }

    func getItems(completion: @escaping ([LandmarkModel]?, LandmarkListProviderError?) -> Void) {
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

