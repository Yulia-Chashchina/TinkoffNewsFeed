//
//  NewsDetailsController.swift
//  TinkoffNewsFeed
//
//  Created by Юлия Чащина on 07/01/2019.
//  Copyright © 2019 Yulia Chashchina. All rights reserved.
//

import UIKit

class NewsDetailsController: UITableViewController {
    
    let service = NewsService()
    var newsDetail: NewsDetail?
    
    var slug = "29122018-tinkoff-bank-money-transfers-during-new-year-holidays-for-individuals"
    
    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
        service.getNewsDetails(slug: slug){ (newsDetail, error) in
            if let error = error {
                //TODO: handle error
                print(error)
            }
            if let newsDetail = newsDetail {
                self.newsDetail = newsDetail
                self.tableView.reloadData()
            }
        }

    }
    
    func setupView() {
        tableView.backgroundColor = UIColor.white
        tableView.register(NewsDetailsCell.self, forCellReuseIdentifier: cellId)
        tableView.rowHeight = tableView.frame.height
        tableView.tableFooterView = UIView(frame: .zero)
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! NewsDetailsCell
        cell.setupViews()
        if let newsDetail = newsDetail {
         cell.setupWithData(newsDetail: newsDetail)
        }
        
//         Configure the cell...

        return cell
    }

}
