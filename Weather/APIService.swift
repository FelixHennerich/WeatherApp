//
//  APIService.swift
//  Weather
//
//  Created by Felix Hennerich on 11.01.23.
//

import Foundation

class APIService {
    public static let shared = APIService()
    
    public enum APIError: Error{
        case error(errorString: String)
    }
    
    public func getJSON<T: Decodable>(urlString: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys, completion: @escaping (Result<T, APIError>) -> Void){
        guard let url = URL(string: urlString) else{
            completion(.failure(.error(errorString: "Error: Invalid URL")))
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            if let error = error{
                completion(.failure(.error(errorString: "Error: \(error.localizedDescription)")))
                return
            }
            
            guard let data = data else{
                completion(.failure(.error(errorString: "Error: Data is corrupt")))
                return
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = dateDecodingStrategy
            decoder.keyDecodingStrategy = keyDecodingStrategy
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            }catch let decodingError{
                completion(.failure(APIError.error(errorString: "Error: \(decodingError.localizedDescription)")))
                return
            }
        }.resume()
    }
}
