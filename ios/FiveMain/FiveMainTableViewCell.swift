//
//  FiveMainTableViewCell.swift
//  ios
//
//  Created by 조예은 on 2020/04/27.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class FiveMainTableViewCell: UITableViewCell {

    
    @IBOutlet weak var alaramButton: UIButton!
    @IBOutlet weak var profileImageButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var followerButton: UIButton!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followingButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    //FiveMainTableViewCell1
    
    @IBOutlet weak var FiveMainTableViewCell2ImageView: UIImageView!
    @IBOutlet weak var FiveMainTableViewCell2Label: UILabel!
    //FiveMainTableViewCell2
    
    
    @IBOutlet weak var timelineImageView: UIImageView!
    @IBOutlet weak var reviewView: UIView!
    @IBOutlet weak var reviewCount: UILabel!
    @IBOutlet weak var haveBeenThereView: UIView!
    @IBOutlet weak var haveBeenThereCount: UILabel!
    @IBOutlet weak var photoView: UIView!
    @IBOutlet weak var photoCount: UILabel!
    //FiveMainTableViewCell3

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func commonInit(_ imageName: String, title: String){
        FiveMainTableViewCell2ImageView.image = UIImage(named: imageName)
        FiveMainTableViewCell2Label.text = title
    }
    
}
