//
//  lovelyPlacesService.swift
//  lovelyPlaces
//
//  Created by Alyona Sabitskaya  on 22.10.2020.
//  Copyright © 2020 Alyona Sabitskaya . All rights reserved.
//

import Foundation

protocol lovelyPlacesServiceProtocol {
    func fetchItems(completion: @escaping ([lovelyPlacesModel]?, Error?) -> Void)
}

/// Получает данные для модуля lovelyPlaces
class lovelyPlacesService: lovelyPlacesServiceProtocol {
    
    private func readJsonFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonDataArray = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonDataArray
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    private func parse(jsonData: Data) -> ([lovelyPlacesModel]?, Error?) {
        do {
            
            let decodedData = try JSONDecoder().decode([lovelyPlacesModel].self,
                                                       from: jsonData)
            return(decodedData, nil)
//            print("Title: ", decodedData.first?.name)
//            print("Description: ", decodedData.first?.coordinates)
//            print("===================================")
        } catch let error {
            print("decode error: \(error)")
            return (nil, error)
        }
    }

    
    func fetchItems(completion: @escaping ([lovelyPlacesModel]?, Error?) -> Void) {
        //completion(nil, nil)
        
        if let localData = self.readJsonFile(forName: "landmarkData") {
            let data = parse(jsonData: localData)
            completion(data.0, data.1)
        }
        
    }
}

