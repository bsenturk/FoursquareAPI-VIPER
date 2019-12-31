//
//  Network.swift
//  FoursquareAPI-VIPER
//
//  Created by Burak Şentürk on 30.12.2019.
//  Copyright © 2019 Burak Şentürk. All rights reserved.
//

import UIKit

final class Network {

    static let shared = Network()

    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
        case patch = "PATCH"
    }

    func request<S: Decodable>(path: String,
                               method: HTTPMethod,
                               bodyParameters: [String: Any]?,
                               urlParameters: [String: String] = [:] ,
                               succeed: @escaping (S) -> Void,
                               failed: @escaping () -> Void) {

        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.foursquare.com"
        urlComponents.path = path
        urlComponents.queryItems = urlParameters.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }

        guard let url = urlComponents.url else { return }

        print("-------------\(url)-------------")

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        /* do {
         guard let bodyParameters = bodyParameters else { return }
         let body = try JSONSerialization.data(withJSONObject: bodyParameters,
         options: [])
         urlRequest.httpBody = body
         } catch {
         }*/

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in

            if let error = error {
                print(error.localizedDescription)
            }

            guard let data = data else { return }

            if let response = response as? HTTPURLResponse {
                print("-------------\(response.statusCode)-------------")
                switch response.statusCode {
                case 200..<399:
                    do {

                        let result = try JSONDecoder().decode(S.self, from: data)

                        DispatchQueue.main.async {
                            succeed(result)
                        }
                    } catch {
                        print(error)
                    }
                case 400..<500:
                    failed()
                default:
                    return
                }
            }

        }.resume()

    }
}
