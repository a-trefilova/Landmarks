//
//  lovelyPlacesModel.swift
//  lovelyPlaces
//
//  Created by Alyona Sabitskaya  on 22.10.2020.
//  Copyright © 2020 Alyona Sabitskaya . All rights reserved.
//

import Foundation

struct LandmarkListViewModel {
    var places: [LandmarkModel]
    var isFavouriteSwitchedOn: Bool
}

/// Модель данных, описывающая ...
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
