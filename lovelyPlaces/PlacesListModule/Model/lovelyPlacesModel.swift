//
//  lovelyPlacesModel.swift
//  lovelyPlaces
//
//  Created by Alyona Sabitskaya  on 22.10.2020.
//  Copyright © 2020 Alyona Sabitskaya . All rights reserved.
//

import Foundation

struct listPlacesViewModel {
    var places: [lovelyPlacesModel]
    var title: String = "Landmarks"
}

/// Модель данных, описывающая ...
struct lovelyPlacesModel: Codable {
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

extension lovelyPlacesModel: Equatable {
    static func == (lhs: lovelyPlacesModel, rhs: lovelyPlacesModel) -> Bool {
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