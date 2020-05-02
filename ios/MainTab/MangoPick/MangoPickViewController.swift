//
//  MangoPickViewController.swift
//  ios
//
//  Created by 조예은 on 2020/04/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class MangoPickViewController: UITabBarController {
    
    
    @IBOutlet weak var locationSelectView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let EatDeal = UINavigationController(rootViewController: EatDealViewController())
        EatDeal.tabBarItem =  UITabBarItem(title: "EAT딜", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        EatDeal.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15)
        let TopList = UINavigationController(rootViewController: TopListViewController())
        TopList.tabBarItem = UITabBarItem(title: "Top리스트", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        TopList.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15) //이미지 제거
        
        
        let tabBarList = [EatDeal, TopList]
        self.viewControllers = tabBarList
        self.tabBar.tintColor = .orange
        UIApplication.shared.statusBarStyle = .lightContent
        

//        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontㄲal: 0.0, vertical: -10.0)

        
    }
    
    override func viewDidLayoutSubviews() {
        navigationController?.isNavigationBarHidden = true
        
        super.viewDidLayoutSubviews()
        var tabFrame            = tabBar.frame
        tabFrame.size.height    = 100
        tabFrame.origin.y       = view.frame.size.height - view.frame.size.height
        tabBar.frame            = tabFrame
        
       
    } //mangopickVC에 적용하기
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
         var items = tabBar.items?.index(of: item)
         print("the selected index is : \(items)")
        
        
    }
}
