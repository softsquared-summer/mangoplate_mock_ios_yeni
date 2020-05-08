//
//  MainTab.swift
//  ios
//
//  Created by 조예은 on 2020/04/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {
    

    let plusButton = UIButton.init(type: .custom)

    
  override func viewDidLoad() {
    super.viewDidLoad()
//    var firstTabImage: UIImage = UIImage(named: "firstItem_gray")!

    let FindingGoodRestaurant = UINavigationController(rootViewController: FindingGoodRestaurantViewController())
    FindingGoodRestaurant.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "ic_search_restaurant_gray.png"), selectedImage: UIImage(named: "ic_search_restaurant_orange.png"))
   

    FindingGoodRestaurant.tabBarItem.image?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))//Give your left alignment number

    FindingGoodRestaurant.tabBarItem.imageInsets = UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 0)

    let MangoPick = UINavigationController(rootViewController: MangoPickViewController())
    MangoPick.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "ic_mango_pick_gray.png.png"), selectedImage: UIImage(named: "ic_mango_pick_orange.png"))
    MangoPick.tabBarItem.image?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))//Give your left alignment number
    MangoPick.tabBarItem.imageInsets = UIEdgeInsets(top: 55, left: 10, bottom: 38, right: 0)

    let Plus = UINavigationController(rootViewController: PlusViewController())
    Plus.tabBarItem = UITabBarItem()
//    Plus.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "ic_addition_square_orange.png"), selectedImage: UIImage(named: "ic_addition_square_orange.png"))
 Plus.tabBarItem.image?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))//Give your left alignment number
        Plus.tabBarItem.imageInsets = UIEdgeInsets(top: 70, left: 10, bottom: 50, right: 0)
//    let plusButton = UIButton(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
//    plusButton.setImage(UIImage(named: "ic_addition_square_orange"), for: .normal)
    Plus.tabBarItem.isEnabled = false
    
    
    

    let News = UINavigationController(rootViewController: NewsViewController())
    News.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "ic_timeline_gray.png"), selectedImage: UIImage(named: "ic_timeline_orange.png"))
    News.tabBarItem.image?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))//Give your left alignment number
    News.tabBarItem.imageInsets = UIEdgeInsets(top: 50, left: 10, bottom: 30, right: 0)
 

    let MyInfo = UINavigationController.init(rootViewController: MyInfoViewController())
    MyInfo.tabBarItem = UITabBarItem.init(title: nil, image: UIImage(named: "ic_my_info_gray.png"), selectedImage: UIImage(named: "ic_my_info_orange.png"))
    MyInfo.tabBarItem.image?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))//Give your left alignment number
    MyInfo.tabBarItem.imageInsets = UIEdgeInsets(top: 38, left: 10, bottom: 20, right: 0)
    
    self.navigationController?.navigationBar.barTintColor = .white

       self.tabBar.barTintColor = UIColor.white // your color

    
        let tabBarList = [FindingGoodRestaurant, MangoPick, Plus, News, MyInfo]
//    tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
    self.viewControllers = tabBarList
    self.tabBar.tintColor = .orange
    UIApplication.shared.statusBarStyle = .lightContent
    
    
    
    plusButton.setImage(UIImage(named: "ic_plus"), for: .normal)
    plusButton.frame = CGRect(x: 100, y: 0, width: 44, height: 44)
        self.view.insertSubview(plusButton, aboveSubview: self.tabBar)

//    view.bringSubviewToFront(plusButton)

//    self.view.insertSubview(plusButton, aboveSubview: self.tabBar)
    plusButton.addTarget(self, action: #selector(presentPlusViewController), for: .touchUpInside)
   
  }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        plusButton.frame = CGRect.init(x: self.tabBar.center.x - 20, y: self.view.bounds.height - 77, width: 44, height: 44)
        plusButton.layer.cornerRadius = 32
    }
    
    @objc func presentPlusViewController(sender: UIButton!) {
      let plusvc = PlusViewController() //change this to your class name
      plusvc.modalPresentationStyle = .fullScreen
      self.present(plusvc, animated: true, completion: nil)
        
    }
    
    
    
    
    /**/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
         guard let items = tabBar.items else { return }
         print("the selected index is : \(items.index(of: item))")
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
