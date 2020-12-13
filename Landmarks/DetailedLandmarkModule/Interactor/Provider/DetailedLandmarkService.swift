protocol DetailedLandmarkServiceProtocol {
    func fetchItems(completion: @escaping (LandmarkModel?, Error?) -> Void)
}

class DetailedLandmarkService: DetailedLandmarkServiceProtocol {

    func fetchItems(completion: @escaping (LandmarkModel?, Error?) -> Void) {
        completion(nil, nil)
    }
}
