//
//  NearCollectionViewCell.swift
//  ios
//
//  Created by 조예은 on 2020/05/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class NearCollectionViewCell: UICollectionViewCell {

    var nearRegionTappedCount = 0

    @IBOutlet weak var nearLabel: UILabel!
    @IBOutlet weak var nearButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func changeNearRegionColor(_ sender: UIButton) {
        
        nearRegionTappedCount += 1
        if(nearRegionTappedCount % 2 == 0) {
        nearButton.setImage(UIImage(named: "ic_locationButton_gray"), for: .normal)
            nearLabel.textColor = UIColor.lightGray
            
        }else {
            nearButton.setImage(UIImage(named: "ic_locationButton_orange"), for: .normal)
            nearLabel.textColor = UIColor.orange


        }
    }
    
}
