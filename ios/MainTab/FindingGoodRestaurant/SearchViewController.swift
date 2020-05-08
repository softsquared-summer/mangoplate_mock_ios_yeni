//
//  SearchViewController.swift
//  ios
//
//  Created by 조예은 on 2020/05/01.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class SearchViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let RecentSearches = UINavigationController(rootViewController: RecentSearchesViewController())
        RecentSearches.tabBarItem =  UITabBarItem(title: "최근 검색어", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        RecentSearches.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15)
        let FindingFriends = UINavigationController(rootViewController: FindingFriendsViewController())
        FindingFriends.tabBarItem = UITabBarItem(title: "친구 찾기", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        FindingFriends.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15) //이미지 제거


        let tabBarList = [RecentSearches, FindingFriends]
        self.viewControllers = tabBarList
        self.tabBar.tintColor = .orange
        UIApplication.shared.statusBarStyle = .lightContent
        // Do any additional setup after loading the view.

    }

    override func viewDidLayoutSubviews() {
//        navigationController?.isNavigationBarHidden = true

        super.viewDidLayoutSubviews()
        var tabFrame            = tabBar.frame
        tabFrame.size.height    = 70
        tabFrame.origin.y       = view.frame.size.height - view.frame.size.height + 87
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
