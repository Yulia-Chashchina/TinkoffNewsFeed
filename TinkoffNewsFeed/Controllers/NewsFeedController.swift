//
//  ViewController.swift
//  TinkoffNewsFeed
//
//  Created by Юлия Чащина on 07/01/2019.
//  Copyright © 2019 Yulia Chashchina. All rights reserved.
//

import UIKit



class NewsFeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let service = NewsService()
    var newsList: [NewsFeed] = []
    
    var slug: String?
    
    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        

        service.getNews() { (newsList, error) in
            if let error = error {
                //TODO: handle error
                print(error)
            }
            if let newsList = newsList {
               self.newsList = newsList
               self.collectionView.reloadData()
            }
        }
    }
    

    
    
    func setupView() {
        navigationItem.title = "Tinkoff News Feed"
        navigationController?.navigationBar.barTintColor = UIColor.yellow
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let feedCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedCell
//        setup cell
        let newsFeed = newsList[indexPath.item]
        feedCell.setupWithData(newsFeed)
        return feedCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let indPath = indexPath
        let article = newsList[indPath.item]
        self.slug = article.slug
        
        performSegue(withIdentifier: "newsSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let newsDetailsVC = segue.destination as? NewsDetailsController {
            newsDetailsVC.slug = self.slug
        }
    }



}

