protocol DetailedLandmarkServiceProtocol {
    func fetchItems(completion: @escaping (LandmarkModel?, Error?) -> Void)
}

/// Получает данные для модуля places
class DetailedLandmarkService: DetailedLandmarkServiceProtocol {

    func fetchItems(completion: @escaping (LandmarkModel?, Error?) -> Void) {
        completion(nil, nil)
    }
}
