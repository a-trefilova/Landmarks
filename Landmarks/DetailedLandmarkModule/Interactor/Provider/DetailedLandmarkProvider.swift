protocol DetailedLandmarkProviderProtocol {
    func getItems(completion: @escaping (LandmarkModel?, DetailedLandmarkProviderError?) -> Void)
}

enum DetailedLandmarkProviderError: Error {
    case getItemsFailed(underlyingError: Error)
}


struct DetailedLandmarkProvider: DetailedLandmarkProviderProtocol {
    let dataStore: DetailedLandmarkDataStore
    let service: DetailedLandmarkServiceProtocol

    init(dataStore: DetailedLandmarkDataStore = DetailedLandmarkDataStore(), service: DetailedLandmarkServiceProtocol = DetailedLandmarkService()) {
        self.dataStore = dataStore
        self.service = service
    }

    func getItems(completion: @escaping (LandmarkModel?, DetailedLandmarkProviderError?) -> Void) {
        if dataStore.models?.id != 0 {
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

