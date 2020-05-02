//
//  MyInfoViewController.swift
//  ios
//
//  Created by 조예은 on 2020/04/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class MyInfoViewController: UIViewController {

    
    @IBOutlet weak var eventButton: UIButton!
    @IBOutlet weak var purchasedEATDealButton: UIButton!
    @IBOutlet weak var EATDealReceivingButton: UIButton!
    @IBOutlet weak var WantToGoButton: UIButton!
    @IBOutlet weak var MyListButton: UIButton!
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var restaurantWhereIRegisteredButton: UIButton!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var reviewButton: UIButton!
       @IBOutlet weak var TimelineView: UIView!
       
       
       @IBOutlet weak var alaramButton: UIButton!
       @IBOutlet weak var profileImageButton: UIButton!
       @IBOutlet weak var nameLabel: UILabel!
       @IBOutlet weak var followerLabel: UILabel!
       @IBOutlet weak var followerButton: UIButton!
       @IBOutlet weak var followingLabel: UILabel!
       @IBOutlet weak var followingButton: UIButton!
       @IBOutlet weak var editButton: UIButton!
       
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
    
    @IBAction func presentEventVC(_ sender: UIButton) {
        let eventViewController: UINavigationController = UINavigationController(rootViewController: EventViewController())
        eventViewController.modalPresentationStyle = .fullScreen

        self.present(eventViewController, animated: true, completion: nil)
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
