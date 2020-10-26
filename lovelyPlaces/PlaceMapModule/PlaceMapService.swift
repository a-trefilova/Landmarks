protocol PlaceMapServiceProtocol {
    func fetchItems(completion: @escaping (lovelyPlacesModel?, Error?) -> Void)
}

/// Получает данные для модуля places
class PlaceMapService: PlaceMapServiceProtocol {

    func fetchItems(completion: @escaping (lovelyPlacesModel?, Error?) -> Void) {
        completion(nil, nil)
    }
}
