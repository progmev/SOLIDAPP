//
//  Country.swift
//  SOLIDApp
//
//  Created by Martynov Evgeny on 16.05.22.
//

import Foundation

struct Country: Decodable {
    var Id: String
    var Time: String
    var Name: String
    var Image: String?
}

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let artistName: String
    let name: String
    let id: String
}
