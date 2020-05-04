//
//  GangNamGuCollectionViewCell.swift
//  ios
//
//  Created by 조예은 on 2020/05/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class GangNamGuCollectionViewCell: UICollectionViewCell {

    var gangNamTappedCount = 0
    
    @IBOutlet weak var dongInGangNamGuLabel: UILabel!
    @IBOutlet weak var dongInGangNamGuButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func changeGangNamRegionColor(_ sender: UIButton) {
        gangNamTappedCount += 1
        if(gangNamTappedCount % 2 == 0) {
        dongInGangNamGuButton.setImage(UIImage(named: "ic_locationButton_gray"), for: .normal)
            dongInGangNamGuLabel.textColor = UIColor.lightGray
            
        }else {
            dongInGangNamGuButton.setImage(UIImage(named: "ic_locationButton_orange"), for: .normal)
            dongInGangNamGuLabel.textColor = UIColor.orange


        }
        
    }
    

}
