//
//  NetworkManager.swift

import Foundation

final class NetworkManager<T: Codable> {
    
    func fetch(from url: URL,
               completion: @escaping(Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response ,error) in
            //if response error
            guard error == nil else {
                completion(.failure(.error(error: error!.localizedDescription)))
                return
            }
            
            //if not http response
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                completion(.failure(.invalidResponse(response: response!.description)))
                return
            }
            
            //if invalid data
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            } catch let error {
                completion(.failure(.decodeError(error: error.localizedDescription)))
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case error(error: String)
    case invalidResponse(response: String)
    case invalidData
    case decodeError(error: String)
}
