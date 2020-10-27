protocol PlaceMapServiceProtocol {
    func fetchItems(completion: @escaping (LandmarkModel?, Error?) -> Void)
}

/// Получает данные для модуля places
class PlaceMapService: PlaceMapServiceProtocol {

    func fetchItems(completion: @escaping (LandmarkModel?, Error?) -> Void) {
        completion(nil, nil)
    }
}
