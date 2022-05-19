//
//  NetworkService {}.swift
//  SOLIDApp
//
//  Created by Martynov Evgeny on 16.05.22.
//

import Foundation

// MARK: - NetworkServiceProtocol

protocol NetworkServiceProtocol {
    func request(urlString: String,
                 completion: @escaping (Data?, Error?) -> Void)
}

// MARK: - NetworkService

final class NetworkService: NetworkServiceProtocol {
    
    func request(urlString: String,
                 completion: @escaping (Data?, Error?) -> Void)
    {
        guard let url = URL(string: urlString) else {
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
        task.resume()
    }
}
