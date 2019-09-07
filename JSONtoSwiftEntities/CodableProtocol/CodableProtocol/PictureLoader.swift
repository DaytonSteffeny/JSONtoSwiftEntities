//
//  PictureLoader.swift
//  CodableProtocol
//
//  Created by Dayton Steffeny on 9/6/19.
//  Copyright © 2019 Dayton Steffeny. All rights reserved.
//

import Foundation


class PicsLoad {
    class func load(urlString: String, completionHandler: @escaping (Trip?, String?) -> Void ) {
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async {
                completionHandler(nil, "DID NOT LOAD!")
            }
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completionHandler(nil, error.localizedDescription)
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(nil, "Unable to access returned data.")
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let photos = try decoder.decode(Trip.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(photos, nil)
                }
            } catch let decodeError {
                DispatchQueue.main.async {
                    completionHandler(nil, decodeError.localizedDescription)
                }
                return
            }
        }
        
        task.resume()
    }
}

struct Trip: Codable {
    let status: String
    let photosPath: String
    var photos: [Photo]
}

struct Photo: Codable {
    let image: String
    let title: String
    let description: String
    let latitude: Double
    let longitude: Double
    let date: String
}
