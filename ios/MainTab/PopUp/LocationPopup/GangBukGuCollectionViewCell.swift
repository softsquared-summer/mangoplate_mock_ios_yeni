//
//  GangBukGuCollectionViewCell.swift
//  ios
//
//  Created by 조예은 on 2020/05/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class GangBukGuCollectionViewCell: UICollectionViewCell {
    var gangBukTappedCount = 0

    @IBOutlet weak var dongInGangBukGuLabel: UILabel!
    @IBOutlet weak var dongInGangBukGuButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func changeGangBukRegionColor(_ sender: UIButton) {
        
        gangBukTappedCount += 1
        
        if(gangBukTappedCount % 2 == 0) {
        dongInGangBukGuButton.setImage(UIImage(named: "ic_locationButton_gray"), for: .normal)
            dongInGangBukGuLabel.textColor = UIColor.lightGray
            
        }else {
            dongInGangBukGuButton.setImage(UIImage(named: "ic_locationButton_orange"), for: .normal)
            dongInGangBukGuLabel.textColor = UIColor.orange

        }
    }
}
