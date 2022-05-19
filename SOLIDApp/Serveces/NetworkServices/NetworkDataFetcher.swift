//
//  NetworkDataFetcher.swift
//  SOLIDApp
//
//  Created by Martynov Evgeny on 16.05.22.
//

import Foundation

// MARK: - DataFetcher

protocol DataFetcher {
    func fetchGenericJSONData<T: Decodable>(urlString: String, response: @escaping (T?) -> Void)
}

// MARK: - NetworkDataFetcher

class NetworkDataFetcher: DataFetcher {
    
    init(networkServices: NetworkServiceProtocol = NetworkService()) {
        self.networkServices = networkServices
    }

    var networkServices: NetworkServiceProtocol
    
    // MARK: Internal

    // Когда будем вызывать, ф-я будет требовать возвращать обьект подписанный под Decodable
    // Что бы закрыь метод для модификации используем протоколы
    // Пробуем теперь удалить ф-ю / изменить параметры)
    func fetchGenericJSONData<T: Decodable>(urlString: String,
                                            response: @escaping (T?) -> Void) {
        print("fetchGenericJSONData: T.self: \(T.self)")
        networkServices.request(urlString: urlString) { data, error in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil)
            }
            let decoded = self.decodeJSON(type: T.self, data: data)
            response(decoded)
        }
    }

    // MARK: Private

    // Декодирование Data в любую модель
    func decodeJSON<T: Decodable>(type: T.Type, data: Data?) -> T? {

        let decoder = JSONDecoder()
        guard let data = data else { return nil }
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
}
