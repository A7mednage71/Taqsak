//
//  NetworkManager.swift
//  Taqsak
//
//  Created by Ahmed Nageh on 23/06/2026.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}

    func fetchWeatherData(for city: String, completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
        let parameters: [String: Any] = [
            "key": APIConstants.apiKey,
            "q": city,
            "days": 3,
            "aqi": "yes", // Air Quality Index
            "alerts": "no"
        ]
        
        AF.request(APIConstants.baseURL, method: .get, parameters: parameters)
            .validate()
            .responseDecodable(of: WeatherResponse.self) { response in
                switch response.result {
                case .success(let weatherResponse):
                    completion(.success(weatherResponse))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func searchCities(matching query: String, completion: @escaping (Result<[SearchCityResult], Error>) -> Void) {
            let parameters: [String: Any] = [
                "key": APIConstants.apiKey,
                "q": query
            ]
            
            AF.request(APIConstants.searchURL, method: .get, parameters: parameters)
                .validate()
                .responseDecodable(of: [SearchCityResult].self) { response in
                    switch response.result {
                    case .success(let cities):
                        completion(.success(cities))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
        }
}
