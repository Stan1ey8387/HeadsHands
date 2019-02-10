//
//  NetworkService.swift
//  HeadsHands
//
//  Created by Захар Бабкин on 07/02/2019.
//  Copyright © 2019 Захар Бабкин. All rights reserved.
//

import Alamofire

class NetworkService {
    static func getWeather(completion: @escaping (Weather?, NetworkError?) -> ()) {
        let url = "http://api.openweathermap.org/data/2.5/weather?lat=55.754214&lon=37.620363&units=metric&APPID=6092c81797c5ab4b3d7b84198c43ccb3"
        
        request(url, method: .get, parameters: nil, encoding: URLEncoding(destination: .queryString), headers: nil)
            .validate()
            .responseJSON { (response) in
                switch response.result{
                case .success(_):
                    guard let data = response.data else {
                        completion(nil, NetworkError.badData)
                        return }
                    do {
                        let weather = try JSONDecoder().decode(Weather.self, from: data)
                        completion(weather, nil)
                    } catch {
                       completion(nil, NetworkError.badJson)
                    }
                    
                case .failure(_):
                    completion(nil, NetworkError.noInterner)
                }
        }
    }
}
