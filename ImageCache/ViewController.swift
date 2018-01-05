//
//  ViewController.swift
//  ImageCache
//
//  Created by KS23225 on 11/25/17.
//  Copyright © 2017 IKSong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var items = [String]()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = ["http://imgs.xkcd.com/comics/election.png",
        "http://imgs.xkcd.com/comics/scantron.png",
        "http://imgs.xkcd.com/comics/secretary_part_5.png",
        "http://imgs.xkcd.com/comics/secretary_part_4.png",
        "http://imgs.xkcd.com/comics/secretary_part_3.png",
        "http://imgs.xkcd.com/comics/secretary_part_2.png",
        "http://imgs.xkcd.com/comics/secretary_part_1.png",
        "http://imgs.xkcd.com/comics/actuarial.png",
        "http://imgs.xkcd.com/comics/scrabble.png",
        "http://imgs.xkcd.com/comics/twitter.png",
        "http://imgs.xkcd.com/comics/morning_routine.png",
        "http://imgs.xkcd.com/comics/going_west.png",
        "http://imgs.xkcd.com/comics/steal_this_comic.png",
        "http://imgs.xkcd.com/comics/numerical_sex_positions.png",
        "http://imgs.xkcd.com/comics/i_am_not_a_ninja.png",
        "http://imgs.xkcd.com/comics/depth.png",
        "http://imgs.xkcd.com/comics/flash_games.png",
        "http://imgs.xkcd.com/comics/fiction_rule_of_thumb.png",
        "http://imgs.xkcd.com/comics/height.png"]
        
        collectionView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? ImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        ImageDownloader.downloadImage(urlString: items[indexPath.row], completion: { image in
            guard let image = image else { return }
            
            cell.cellImageView.image = image 
        })
        
        return cell 
    }
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
//        indexPaths.forEach { indexPath in
//            ImageDownloader.downloadImage(urlString: items[indexPath.row], completion: { _ in
//            })
//        }
    }
}

