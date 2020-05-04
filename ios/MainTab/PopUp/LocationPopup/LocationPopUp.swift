//
//  LocationPopUp.swift
//  ios
//
//  Created by 조예은 on 2020/05/01.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class LocationPopUp: UITabBarController {
    unowned var dataManager: DistinctDataManager {
        get {
            return DistinctDataManager()
        }
    }
    
    var locationPopUpDelegate: LocationPopUpDelegate!
    
    var gangnamguTitle = ""
    var gangbukmguTitle = ""

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
    
    dataManager.getDistincts(self)
//    gangNamGu.tabBarItem.title = gangnamguTitle
//    gangBukGu.tabBarItem.title = gangbukmguTitle

    
    
   }
    
//    func setDistincts(_ gangnamguDistinctTitle: String, _ gangbukguDistinctTitle: String){
//        gangnamguTitle = gangnamguDistinctTitle
//        gangbukmguTitle = gangbukguDistinctTitle
//    }
   
    
    override func viewDidLayoutSubviews() {
        navigationController?.isNavigationBarHidden = true
        
        super.viewDidLayoutSubviews()
        var tabFrame = tabBar.frame
        tabFrame.size.height    = 50
        tabFrame.origin.y = view.frame.size.height - view.frame.size.height + 536
        tabBar.frame = tabFrame
        
       
    } //tabbar가 tabbarview의 상단에 생성돼야함
    
    @IBAction func pressedSettingLocation(_ sender: UIButton) {
    self.dismiss(animated: false, completion: nil)

    }
    
}
