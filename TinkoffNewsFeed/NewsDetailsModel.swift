//
//  NewsDetailsModel.swift
//  TinkoffNewsFeed
//
//  Created by Юлия Чащина on 10/01/2019.
//  Copyright © 2019 Yulia Chashchina. All rights reserved.
//

import Foundation

//struct TinkoffNewsDetails: Codable {
//    struct Response: Codable {
//        let title: String
//        let text: String
//    }
//}

struct TinkoffNewsDetails: Codable {
    let response: NewsDetail
}

struct NewsDetail: Codable {
    let title: String
    let text: String
}
