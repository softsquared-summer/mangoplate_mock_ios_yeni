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
        EatDeal.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -20)
        EatDeal.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18.0, weight: UIFont.Weight.semibold)], for: .normal)
        
        
        let Story = UINavigationController(rootViewController: StoryViewController())
        Story.tabBarItem =  UITabBarItem(title: "스토리", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        Story.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -20)
        Story.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18.0, weight: UIFont.Weight.semibold)], for: .normal)
        
        let TopList = UINavigationController(rootViewController: TopListViewController())
        TopList.tabBarItem = UITabBarItem(title: "Top리스트", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        TopList.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -20) //이미지 제거
        TopList.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18.0, weight: UIFont.Weight.semibold)], for: .normal)
        
        self.navigationController?.navigationBar.barTintColor = .white
        
        let tabBarList = [EatDeal, Story, TopList]
        self.viewControllers = tabBarList
        self.tabBar.tintColor = .orange
        
//        let systemFontAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18.0, weight: UIFont.Weight.bold)]
//               UITabBarItem.appearance().setTitleTextAttributes(systemFontAttribute, for: .normal)
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        

//        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -10.0)

        
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
