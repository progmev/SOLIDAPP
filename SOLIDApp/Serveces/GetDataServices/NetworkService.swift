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

/*
 NetworkService - модуль нижнего уровния для NetworkDataFetcher
 */
final class NetworkService: NetworkServiceProtocol {
    
    public func request(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        // создание URLSessionDataTask тоже вынесем в отдельную ф-ю
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }

    private func createDataTask(from requst: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: requst, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        })
    }
}
