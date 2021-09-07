//
//  NetworkManager.swift
//  MyRides
//
//  Created by Marco Espinoza on 8/11/21.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    let myRidesURL = "https://storage.googleapis.com/hsd-interview-resources/simplified_my_rides_response.json"
    
    func getJSON(completed: @escaping (Result<[Ride], RidesError>) -> Void) {
        guard let url = URL(string: myRidesURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard error == nil else {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .iso8601
                let rides = try decoder.decode(Rides.self, from: data)
                completed(.success(rides.rides))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
}
