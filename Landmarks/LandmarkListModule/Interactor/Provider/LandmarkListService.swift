
import Foundation

protocol LandmarkListServiceProtocol {
    func fetchItems(completion: @escaping ([LandmarkModel]?, Error?) -> Void)
}


class LandmarkListService: LandmarkListServiceProtocol {
    
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
    
    private func parse(jsonData: Data) -> ([LandmarkModel]?, Error?) {
        do {
            
            let decodedData = try JSONDecoder().decode([LandmarkModel].self,
                                                       from: jsonData)
            return(decodedData, nil)
        } catch let error {
            print("decode error: \(error)")
            return (nil, error)
        }
    }

    
    func fetchItems(completion: @escaping ([LandmarkModel]?, Error?) -> Void) {
        
        if let localData = self.readJsonFile(forName: "landmarkData") {
            let data = parse(jsonData: localData)
            completion(data.0, data.1)
        }
        
    }
}

