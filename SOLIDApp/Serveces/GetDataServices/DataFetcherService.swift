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
    func fetchLocalCountry(completion: @escaping ([Country]?) -> Void)
}

/*
 Модуль высшего уровня
 */

final class DataFetcherService: DataFetcherServiceProtocol {
    /*
     астракции для DataFetcherService
     */
    var networkDataFetcher: DataFetcher
    var localDataFetcher: DataFetcher
    
    init(networkDataFetcher: DataFetcher = NetworkDataFetcher(),
         localDataFetcher: DataFetcher = LocalDataFetcher()) {
        self.networkDataFetcher = networkDataFetcher
        self.localDataFetcher = localDataFetcher
    }

    func fetchPaidGames(completion: @escaping (AppGroup?) -> Void) {
        networkDataFetcher.fetchGenericJSONData(urlString: Constants.urlPaidGames.rawValue, response: completion)
    }

    func fetchFreeGames(completion: @escaping (AppGroup?) -> Void) {
        networkDataFetcher.fetchGenericJSONData(urlString: Constants.urlFreeGames.rawValue, response: completion)
    }

    func fetchCountry(completion: @escaping ([Country]?) -> Void) {
        networkDataFetcher.fetchGenericJSONData(urlString: Constants.urlString.rawValue, response: completion)
    }

    // @escaping - сбегабщее выражение (замыкание сбегает из области видимости ф-ции fetch...),
    // необходимо для того что бы в конце выполнения ф-ции, блок задержался в памяти до того момента пока не прийдет ответ от сервера.
    // Показываем что замыкание будет вызвано после выполнения ф-ции. Такие ф-ции часто используются в асинхронных операциях
    
    func fetchLocalCountry(completion: @escaping ([Country]?) -> Void) {
        let urlString = "usersAPI.txt"
        localDataFetcher.fetchGenericJSONData(urlString: urlString, response: completion)
    }
}
