//
//  DataFetcherService.swift
//  SOLIDApp
//
//  Created by Martynov Evgeny on 19.05.22.
//

import Foundation

protocol DataFetcherServiceProtocol {
    func fetchPaidGames(completion: @escaping (AppGroup?) -> Void)
    func fetchFreeGames(completion: @escaping (AppGroup?) -> Void)
    func fetchCountry(completion: @escaping ([Country]?) -> Void)
}

class DataFetcherService: DataFetcherServiceProtocol {
    
    var dataFetcher: DataFetcher
    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }

    func fetchPaidGames(completion: @escaping (AppGroup?) -> Void) {
        dataFetcher.fetchGenericJSONData(urlString: Constants.urlPaidGames.rawValue, response: completion)
    }

    func fetchFreeGames(completion: @escaping (AppGroup?) -> Void) {
        dataFetcher.fetchGenericJSONData(urlString: Constants.urlFreeGames.rawValue, response: completion)
    }

    func fetchCountry(completion: @escaping ([Country]?) -> Void) {
        dataFetcher.fetchGenericJSONData(urlString: Constants.urlString.rawValue, response: completion)
    }

    // @escaping - сбегабщее выражение (замыкание сбегает из области видимости ф-ции fetch...),
    // необходимо для того что бы в конце выполнения ф-ции, блок задержался в памяти до того момента пока не прийдет ответ от сервера.
    // Показываем что замыкание будет вызвано после выполнения ф-ции. Такие ф-ции часто используются в асинхронных операциях
}
