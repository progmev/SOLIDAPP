//
//  LocalDataFetcher.swift
//  SOLIDApp
//
//  Created by Martynov Evgeny on 19.05.22.
//

import Foundation

/*
 LocalDataFetcher - модуль нижнего уровния для DataFetcherService
 */
final class LocalDataFetcher: NetworkDataFetcher {
    override func fetchGenericJSONData<T: Decodable>(urlString: String,
                                            response: @escaping (T?) -> Void) {
        // достаем localFileUrl
        guard let localFileUrl = Bundle.main.url(forResource: urlString, withExtension: nil) else {
            print("Couldn't find \(urlString) in main bundle")
            response(nil)
            return
        }
        // достаем данные по localFileUrl
        let data = try? Data(contentsOf: localFileUrl)
        // парсим
        let decoded = self.decodeJSON(type: T.self, data: data)
        response(decoded)
    }
}
