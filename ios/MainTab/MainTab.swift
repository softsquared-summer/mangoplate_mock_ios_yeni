//
//  MainTab.swift
//  ios
//
//  Created by 조예은 on 2020/04/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
class MainTab: UITabBarController {
  override func viewDidLoad() {
    super.viewDidLoad()
    var firstTabImage: UIImage = UIImage(named: "firstItem_gray")!

    let findingGoodRestaurant = UINavigationController(rootViewController: findingGoodRestaurantViewController())
    findingGoodRestaurant.tabBarItem = UITabBarItem(title: nil, image: firstTabImage, selectedImage: UIImage(named: "firstItem_orange"))
//    findingGoodRestaurant.tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 15, bottom: 0, right: 0)

    let MangoPick = UINavigationController(rootViewController: MangoPickViewController())
    MangoPick.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "secondeItem_gray"), selectedImage: UIImage(named: "secondeItem_orange"))
    MangoPick.tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 60, bottom: 0, right: 0)

    let Plus = UINavigationController(rootViewController: PlusViewController())
       Plus.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "plus"), selectedImage: UIImage(named: "plus")) //plus버튼
    Plus.tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 60, bottom: 0, right: 0)

    let News = UINavigationController(rootViewController: NewsViewController())
    News.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "fourthItem_gray"), selectedImage: UIImage(named: "fourthItem_orange"))
    News.tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 60, bottom: 0, right: 0)

    let MyInfo = UINavigationController.init(rootViewController: MyInfoViewController())
    MyInfo.tabBarItem = UITabBarItem.init(title: nil, image: UIImage(named: "fiveItem_gray"), selectedImage: UIImage(named: "fiveItem_orange"))
    MyInfo.tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 60, bottom: 0, right: 0)
        let tabBarList = [findingGoodRestaurant, MangoPick, Plus, News, MyInfo]
//    tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
    self.viewControllers = tabBarList
    self.tabBar.tintColor = .orange
    UIApplication.shared.statusBarStyle = .lightContent
  }
    
    
//    override func viewDidLayoutSubviews() {
//
//        super.viewDidLayoutSubviews()
//        var tabFrame            = tabBar.frame
//        tabFrame.size.height    = 65
//        tabFrame.origin.y       = view.frame.size.height - view.frame.size.height + 70
//        tabBar.frame            = tabFrame
//    } //mangopickVC에 적용하기
}


//
//extension UITabBar {
//    override public func sizeThatFits(_ size: CGSize) -> CGSize {
//        return CGSize(width: UIScreen.main.bounds.width, height: 200)
//    }
//} //높이 늘리기
