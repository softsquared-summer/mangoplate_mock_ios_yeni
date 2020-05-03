//
//  CollectionViewCell.swift
//  ios
//
//  Created by 조예은 on 2020/05/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {


    @IBOutlet weak var collectionButton: UIButton!
    @IBOutlet weak var restaurantImageview: UIImageView!
    @IBOutlet weak var restaurantRating: UILabel!
    @IBOutlet weak var restaurantTitle: UILabel!
    @IBOutlet weak var restaurantArea: UILabel!
    @IBOutlet weak var restaurantDistance: UILabel!
    @IBOutlet weak var restaurantSeenNum: UILabel!
    @IBOutlet weak var restaurantReviewNum: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func presentDetailRestaurantViewController(_ sender: UIButton) {
//        let detailRestaurantViewController: UINavigationController = UINavigationController(rootViewController: DetailRestaurantViewController())
//        detailRestaurantViewController.modalPresentationStyle = .fullScreen
//
//        present(detailRestaurantViewController, animated: true, completion: nil)
    }
    
    
}
