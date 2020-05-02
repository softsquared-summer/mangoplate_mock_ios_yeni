//
//  FifthEventViewController.swift
//  ios
//
//  Created by 조예은 on 2020/05/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class FifthEventViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var backbutton = UIButton(type: .custom)
                backbutton.setImage(UIImage(named: "backBarButtonOrange.png"), for: .normal) // Image can be downloaded from here below link
                backbutton.setTitle("이벤트", for: .normal)
                backbutton.tintColor = .orange
        //        backbutton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
                backbutton.setTitleColor(backbutton.tintColor, for: .normal) // You can change the TitleColor

                backbutton.addTarget(self, action: #selector(self.backAction), for: .touchUpInside)

                self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        // Do any additional setup after loading the view.
    }

    @objc func backAction(_ sender: UIButton) {
             let _ = self.dismiss(animated: true, completion: nil)
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
