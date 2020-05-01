//
//  MyInfoViewController.swift
//  ios
//
//  Created by 조예은 on 2020/04/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class MyInfoViewController: UIViewController {

    
       @IBOutlet weak var eventView: UIView!
       @IBOutlet weak var purchasedEATDealView: UIView!
       @IBOutlet weak var EATDealReceivingNotification: UIView!
       @IBOutlet weak var TimelineView: UIView!
       @IBOutlet weak var WantToGoView: UIView!
       @IBOutlet weak var MyListView: UIView!
       @IBOutlet weak var bookmarkView: UIView!
       @IBOutlet weak var restaurantWhereIRegisteredView: UIView!
       @IBOutlet weak var settingView: UIView!
       
       @IBOutlet weak var alaramButton: UIButton!
       @IBOutlet weak var profileImageButton: UIButton!
       @IBOutlet weak var nameLabel: UILabel!
       @IBOutlet weak var followerLabel: UILabel!
       @IBOutlet weak var followerButton: UIButton!
       @IBOutlet weak var followingLabel: UILabel!
       @IBOutlet weak var followingButton: UIButton!
       @IBOutlet weak var editButton: UIButton!
       
       @IBOutlet weak var reviewView: UIView!
       @IBOutlet weak var reviewCount: UILabel!
       @IBOutlet weak var haveBeenThereView: UIView!
       @IBOutlet weak var haveBeenThereCount: UILabel!
       @IBOutlet weak var photoView: UIView!
       @IBOutlet weak var photoCount: UILabel!
    
    override func viewDidLoad() {
        navigationController?.isNavigationBarHidden = true

        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
