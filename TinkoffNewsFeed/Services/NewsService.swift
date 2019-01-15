//
//  NewsService.swift
//  TinkoffNewsFeed
//
//  Created by Юлия Чащина on 09/01/2019.
//  Copyright © 2019 Yulia Chashchina. All rights reserved.
//

import Foundation

class NewsService {
    
    func getNews(completion:(([NewsFeed]?, Error?) -> Void)?) {
        let path = "https://cfg.tinkoff.ru/news/public/api/platform/v1/getArticles"
        let url = URL(string: path)
        let task = URLSession.shared.dataTask(with: url!) { (data, responce, Error) in
            do{
                let articlesData = try JSONDecoder().decode(TinkoffNews.self, from: data!)
//                print(articlesData.response.news[0].title)
                
                let newsList = articlesData.response.news
                
                DispatchQueue.main.async {
                    completion?(newsList, nil)
                }
                
//                print(newsList)
            }catch{
                DispatchQueue.main.async {
                    completion?(nil, error)
                }
                
//                print(error)
            }
            
        }
        task.resume()
    }
        
    
    func getNewsDetails(slug: String, comletion:((NewsDetail?, Error?) -> Void)?) {
        let path = "https://cfg.tinkoff.ru/news/public/api/platform/v1/getArticle?urlSlug=\(slug)"
        let url = URL(string: path)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            do {
                let detailsData = try JSONDecoder().decode(TinkoffNewsDetails.self, from: data!)
//                print(detailsData.response.title)
                let newsDetail = detailsData.response
                
                DispatchQueue.main.async {
                    comletion?(newsDetail, nil)
                }
                
            } catch {
                
                DispatchQueue.main.async {
                    comletion?(nil,error)
                }
                
            }
        }
        task.resume()
    }

    
    
    
}
