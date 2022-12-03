//
//  DataService.swift
//  swift-login-system-tutorial
//
//  Created by YouTube on 2022-12-03.
//

import Foundation

class DataService {
    
    static func getData(completion: @escaping (Result<DataArray, Error>) -> Void) {
        guard let request = Endpoint.getData().request else { return }
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(ServiceError.serverError(error.localizedDescription)))
                } else {
                    completion(.failure(ServiceError.unkown()))
                }
                return
            }
            
            let decoder = JSONDecoder()
            
            if let array = try? decoder.decode(DataArray.self, from: data) {
                completion(.success(array))
                return
            }
            else if let errorMessage = try? decoder.decode(ErrorResponse.self, from: data) {
                completion(.failure(ServiceError.serverError(errorMessage.error)))
                return
            }
            else {
                completion(.failure(ServiceError.decodingError()))
                return
            }
        }.resume()
    }
}
