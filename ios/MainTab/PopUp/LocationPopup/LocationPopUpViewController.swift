//
//  LocationPopUpViewController.swift
//  ios
//
//  Created by 조예은 on 2020/04/30.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class LocationPopUpViewController: UITabBarController {

    @IBOutlet weak var tabBarView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let recentRegion = UINavigationController(rootViewController: RecentRegionViewController())
        recentRegion.tabBarItem =  UITabBarItem(title: "최근지역", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        recentRegion.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15)
        let near = UINavigationController(rootViewController: NearViewController())
        near.tabBarItem = UITabBarItem(title: "내근처", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        near.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15) //이미지 제거
        let gangNamGu = UINavigationController(rootViewController: GangNamGuViewController())
        gangNamGu.tabBarItem = UITabBarItem(title: "서울-강남", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        gangNamGu.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15)
        let gangBukGu = UINavigationController(rootViewController: GangBukGuViewController())
        gangBukGu.tabBarItem = UITabBarItem(title: "서울-강북", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        gangBukGu.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15)
        
        
        let tabBarList = [recentRegion, near, gangNamGu, gangBukGu]
        self.viewControllers = tabBarList
        self.tabBar.tintColor = .orange
        UIApplication.shared.statusBarStyle = .lightContent

        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        navigationController?.isNavigationBarHidden = true
        
        super.viewDidLayoutSubviews()
        var tabFrame            = tabBar.frame
        tabFrame.size.height    = 100
        tabFrame.origin.y       = tabBarView.frame.size.height - tabBarView.frame.size.height
        tabBar.frame            = tabFrame
        
       
    } //tabbar가 tabbarview의 상단에 생성돼야함

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
