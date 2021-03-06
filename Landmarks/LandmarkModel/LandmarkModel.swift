
import Foundation

struct LandmarkListViewModel {
    var places: [LandmarkModel]
    var isFavouriteSwitchedOn: Bool
}


struct LandmarkModel: Codable {
    // Example
    let id: Int
    let name: String
    let category: Category
    let city: String
    let state: String
    let park: String
    let coordinates: Coordinates
    let imageName: String
    let isFavorite: Bool
    
}

extension LandmarkModel: Equatable {
    static func == (lhs: LandmarkModel, rhs: LandmarkModel) -> Bool {
        return lhs.id == rhs.id
    }
}

struct Coordinates: Codable {
    let longitude, latitude: Double
}
enum Category: String, Codable {
    case featured = "Featured"
    case lakes = "Lakes"
    case rivers = "Rivers"
}
