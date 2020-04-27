//
//  ThreeMainViewController.swift
//  ios
//
//  Created by 조예은 on 2020/04/26.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class ThreeMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func PresentPreviousView(_ sender: UIButton) {

        self.dismiss(animated: true, completion: nil) //ThreeMainViewController를 스택에서 지움으로써 이전에 띄웠던 뷰로 돌아가짐 (x버튼 누르면 이전에 탭했었던 뷰 보여주기 (main,second,fourth,five중))
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
