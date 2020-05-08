//
//  CollectionViewCell.swift
//  ios
//
//  Created by 조예은 on 2020/05/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

//protocol CustomCellDelegate: class {
//    func sharePressed(cell: CollectionViewCell)
//}

class CollectionViewCell: UICollectionViewCell {

//    var delegate: CustomCellDelegate?
//
//    func didTapShare(sender: UIButton) {
//        delegate?.sharePressed(cell: self)
//    }

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

//    @IBAction func presentDetailRestaurantViewController(_ sender: UIButton) {
////        let detailRestaurantPopUpStoryboard = UIStoryboard(name: "DetailRestaurantPopUp", bundle: Bundle.main)
////        guard let detailRestaurantPopUp = detailRestaurantPopUpStoryboard
////                    .instantiateViewController(withIdentifier: "DetailRestaurantPopUp") as? DetailRestaurantPopUp else {
////                    return
////                }
////        detailRestaurantPopUp.detailRestaurantPopUpDelegate = self as! DetailRestaurantPopUpDelegate
////                detailRestaurantPopUp.modalPresentationStyle = .custom
////        self.window?.rootViewController?.present(detailRestaurantPopUp, animated: true, completion: nil)
//
//    }

}
