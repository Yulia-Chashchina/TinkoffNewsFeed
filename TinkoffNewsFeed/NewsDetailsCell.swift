//
//  NewsDetailsCell.swift
//  TinkoffNewsFeed
//
//  Created by Юлия Чащина on 07/01/2019.
//  Copyright © 2019 Yulia Chashchina. All rights reserved.
//

import UIKit

class NewsDetailsCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "Sample headline"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let newsTextField: UITextField = {
        let textField = UITextField()
        textField.text = "Sample text"
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.isUserInteractionEnabled = false
        return textField
    }()
    
    func setupViews() {
        addSubview(nameLabel)
        addSubview(newsTextField)
        
        addConstraintsWithFormat(format: "H:|-15-[v0]-15-|", views: nameLabel)
        addConstraintsWithFormat(format: "V:|-20-[v0]-20-[v1]", views: nameLabel, newsTextField)
        addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: newsTextField)
    }
    
}
