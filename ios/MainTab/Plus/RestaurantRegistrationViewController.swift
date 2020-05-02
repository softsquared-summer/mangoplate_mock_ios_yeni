//
//  RestaurantRegistrationViewController.swift
//  ios
//
//  Created by 조예은 on 2020/04/30.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class RestaurantRegistrationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func RRPresentPreviousTab(_ sender: UIButton) {
        // 엑스 버튼 누르면 이전 뷰로 돌아가도록(이전에 선택되어있던 탭으로)
        self.dismiss(animated: true, completion: nil)


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
