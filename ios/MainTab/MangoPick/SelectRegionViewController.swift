//
//  SelectRegionViewController.swift
//  ios
//
//  Created by 조예은 on 2020/05/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class SelectRegionViewController: UITabBarController {
    
    @IBAction func pressedSettingLocation(_ sender: UIButton) {
    self.dismiss(animated: false, completion: nil)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let eatDealGangNamGu = UINavigationController(rootViewController: EatDealGangNamGuViewController())
        eatDealGangNamGu.tabBarItem = UITabBarItem(title: "서울-강남", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        eatDealGangNamGu.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15)

        let eatDealGangBukGu = UINavigationController(rootViewController: EatDealGangBukGuViewController())
        eatDealGangBukGu.tabBarItem = UITabBarItem(title: "서울-강북", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        eatDealGangBukGu.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15)

        let tabBarList = [eatDealGangNamGu, eatDealGangBukGu]


        self.viewControllers = tabBarList
        self.tabBar.tintColor = .orange
        UIApplication.shared.statusBarStyle = .lightContent

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        
        
        super.viewDidLayoutSubviews()
        var tabFrame = tabBar.frame
        tabFrame.size.height    = 50
        tabFrame.origin.y = view.frame.size.height - view.frame.size.height + 90
        tabBar.frame = tabFrame
        
       
    }

    
    
    @IBAction func pressedEatDealSettingLocation(_ sender: UIButton) {
    self.dismiss(animated: false, completion: nil)

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
