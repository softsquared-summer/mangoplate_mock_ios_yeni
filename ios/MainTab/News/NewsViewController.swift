//
//  NewsViewController.swift
//  ios
//
//  Created by 조예은 on 2020/04/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class NewsViewController: UITabBarController {

    override func viewDidLoad() {
//        navigationController?.isNavigationBarHidden = true

        super.viewDidLoad()
        let newsAll = UINavigationController(rootViewController: NewsAllViewController())
        newsAll.tabBarItem =  UITabBarItem(title: "전체", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        newsAll.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 0)
        let newsFollowing = UINavigationController(rootViewController: NewsFollowingViewController())
        newsFollowing.tabBarItem = UITabBarItem(title: "팔로잉", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        newsFollowing.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical:
            0) //이미지 제거
        
        
        let tabBarList = [newsAll, newsFollowing]
        self.viewControllers = tabBarList
        self.tabBar.tintColor = .orange
        UIApplication.shared.statusBarStyle = .lightContent

        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        navigationController?.isNavigationBarHidden = true
        
        super.viewDidLayoutSubviews()
        var tabFrame            = tabBar.frame
        tabFrame.size.height    = 70
        print("tabFrame.size.height: \(tabFrame.size.height)")
        tabFrame.origin.y       = view.frame.size.height - view.frame.size.height
        tabBar.frame            = tabFrame
        
       
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
