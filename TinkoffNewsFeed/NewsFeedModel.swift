//
//  NewsFeedModel.swift
//  TinkoffNewsFeed
//
//  Created by Юлия Чащина on 08/01/2019.
//  Copyright © 2019 Yulia Chashchina. All rights reserved.
//

import Foundation

struct TinkoffNews: Codable{
    let response: Response
}

struct Response: Codable {
    let news: [NewsFeed]
    enum CodingKeys: String, CodingKey {
        case news = "news"
    }
}

        
struct NewsFeed: Codable {

    let title: String
    let slug: String
    

}
