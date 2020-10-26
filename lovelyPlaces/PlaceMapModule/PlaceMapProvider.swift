protocol PlaceMapProviderProtocol {
    func getItems(completion: @escaping (lovelyPlacesModel?, PlaceMapProviderError?) -> Void)
}

enum PlaceMapProviderError: Error {
    case getItemsFailed(underlyingError: Error)
}


struct PlaceMapProvider: PlaceMapProviderProtocol {
    let dataStore: PlaceMapDataStore
    let service: PlaceMapServiceProtocol

    init(dataStore: PlaceMapDataStore = PlaceMapDataStore(), service: PlaceMapServiceProtocol = PlaceMapService()) {
        self.dataStore = dataStore
        self.service = service
    }

    func getItems(completion: @escaping (lovelyPlacesModel?, PlaceMapProviderError?) -> Void) {
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

