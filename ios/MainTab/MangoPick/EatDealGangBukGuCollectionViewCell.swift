//
//  EatDealGangBukGuCollectionViewCell.swift
//  ios
//
//  Created by 조예은 on 2020/05/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class EatDealGangBukGuCollectionViewCell: UICollectionViewCell {
    var eatDealGangBukTappedCount = 0


    @IBOutlet weak var eatDealDongInGangBukGuLabel: UILabel!
    @IBOutlet weak var eatDealDongInGangBukGuButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    @IBAction func changeEatDealGangBukRegionColor(_ sender: UIButton) {
        
        eatDealGangBukTappedCount += 1
        
        if(eatDealGangBukTappedCount % 2 == 0) {
        eatDealDongInGangBukGuButton.setImage(UIImage(named: "ic_locationButton_gray"), for: .normal)
            eatDealDongInGangBukGuLabel.textColor = UIColor.lightGray
            
        }else {
            eatDealDongInGangBukGuButton.setImage(UIImage(named: "ic_locationButton_orange"), for: .normal)
            eatDealDongInGangBukGuLabel.textColor = UIColor.orange

        }
    }
}
