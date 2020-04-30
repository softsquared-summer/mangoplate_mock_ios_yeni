//
//  PlusViewController.swift
//  ios
//
//  Created by 조예은 on 2020/04/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class PlusViewController: UIViewController {

    override func viewDidLoad() {
        navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true

        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func PresentEatDealVC(_ sender: UIButton) {
        let mainTabvc = MainTab() //change this to your class name
        mainTabvc.selectedIndex = 1
        mainTabvc.modalPresentationStyle = .fullScreen
        self.present(mainTabvc, animated: true, completion: nil)
        //mainTabvc로 간다음 망고픽탭이 선택되어 있는 상태로 두기
    }
    
    @IBAction func PresentHaveBeenThereVC(_ sender: UIButton) {
        let haveBeenTherevc = HaveBeenThereViewController() //change this to your class name
        haveBeenTherevc.modalPresentationStyle = .fullScreen
        self.present(haveBeenTherevc, animated: true, completion: nil)
    }//뷰 띄워주고 엑스 버튼 누르면 이전 뷰로 돌아가도록(이전에 선택되어있던 탭으로)
    
    
    @IBAction func PresentRestaurantRegistrationVC(_ sender: UIButton) {
        let restaurantRegistrationvc = RestaurantRegistrationViewController() //change this to your class name
        restaurantRegistrationvc.modalPresentationStyle = .fullScreen
        self.present(restaurantRegistrationvc, animated: true, completion: nil)
        
    }//뷰 띄워주고 엑스 버튼 누르면 이전 뷰로 돌아가도록(이전에 선택되어있던 탭으로)
    
    @IBAction func PresentPreviousTab(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }//x버튼 누르면 이전에 탭했었던 뷰 보여주기
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
