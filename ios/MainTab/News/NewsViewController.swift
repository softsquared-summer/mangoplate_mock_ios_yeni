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
        newsAll.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -10)
        let newsFollowing = UINavigationController(rootViewController: NewsFollowingViewController())
        newsFollowing.tabBarItem = UITabBarItem(title: "팔로잉", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        newsFollowing.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical:
            -10) //이미지 제거
        let holic = UINavigationController(rootViewController: holicViewController())
        holic.tabBarItem =  UITabBarItem(title: "홀릭", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        holic.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -10)
        self.navigationController?.navigationBar.barTintColor = .white
        self.tabBar.barTintColor = UIColor.white // your color

        let tabBarList = [newsAll, newsFollowing, holic]

               
        self.viewControllers = tabBarList
        self.tabBar.tintColor = .orange
        let systemFontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14.0)]
                      UITabBarItem.appearance().setTitleTextAttributes(systemFontAttributes, for: .normal)
        UIApplication.shared.statusBarStyle = .lightContent
        

       

        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        navigationController?.isNavigationBarHidden = true
        
        super.viewDidLayoutSubviews()
        var tabFrame            = tabBar.frame
        tabFrame.size.height    = 40
        print("tabFrame.size.height: \(tabFrame.size.height)")
        tabFrame.origin.y       = view.frame.size.height - view.frame.size.height + 110
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
