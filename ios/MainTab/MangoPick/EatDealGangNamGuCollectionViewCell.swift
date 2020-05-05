//
//  EatDealGangNamGuCollectionViewCell.swift
//  ios
//
//  Created by 조예은 on 2020/05/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class EatDealGangNamGuCollectionViewCell: UICollectionViewCell {
    var eatDealGangNamTappedCount = 0


    @IBOutlet weak var eatDealDongInGangNamGuLabel: UILabel!
       @IBOutlet weak var eatDealDongInGangNamGuButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func changeEatDealGangNamRegionColor(_ sender: UIButton) {
           
           eatDealGangNamTappedCount += 1
           
           if(eatDealGangNamTappedCount % 2 == 0) {
           eatDealDongInGangNamGuButton.setImage(UIImage(named: "ic_locationButton_gray"), for: .normal)
               eatDealDongInGangNamGuLabel.textColor = UIColor.lightGray
               
           }else {
               eatDealDongInGangNamGuButton.setImage(UIImage(named: "ic_locationButton_orange"), for: .normal)
               eatDealDongInGangNamGuLabel.textColor = UIColor.orange

           }
       }

}
