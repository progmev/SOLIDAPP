//
//  NetworkDataFetcher.swift
//  SOLIDApp
//
//  Created by Martynov Evgeny on 16.05.22.
//

import Foundation

// MARK: - NetworkDataFetcher

class NetworkDataFetcher {

    static let shared = NetworkDataFetcher()
    private init(networkServices: NetworkServiceProtocol = NetworkService()) {
        self.networkServices = networkServices
    }

    var networkServices: NetworkServiceProtocol

    func fetchPaidGames(completion: @escaping (AppGroup?) -> Void) {
        networkServices.request(urlString: Constants.urlPaidGames.rawValue) { data, error in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            let appGroup = try? decoder.decode(AppGroup.self, from: data)
            completion(appGroup)
        }
    }
    func fetchFreeGames(completion: @escaping (AppGroup?) -> Void) {
        networkServices.request(urlString: Constants.urlFreeGames.rawValue) { data, error in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            let appGroup = try? decoder.decode(AppGroup.self, from: data)
            completion(appGroup)
        }
    }
    func fetchCountries(completion: @escaping ([Country]?) -> Void) {
        networkServices.request(urlString: Constants.urlString.rawValue) { data, error in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            let countries = try? decoder.decode([Country].self, from: data)
            completion(countries)
        }
    }
}
