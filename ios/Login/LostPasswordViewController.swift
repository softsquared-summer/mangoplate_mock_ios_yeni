//
//  LostPasswordViewController.swift
//  ios
//
//  Created by 조예은 on 2020/04/30.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class LostPasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var backbutton = UIButton(type: .custom)
             backbutton.setImage(UIImage(named: "ic_left_arrow_gray.png"), for: .normal) // Image can be downloaded from here below link
             backbutton.setTitle("비밀번호 찾기", for: .normal)
             backbutton.tintColor = .black
             backbutton.setTitleColor(backbutton.tintColor, for: .normal) // You can change the TitleColor

             backbutton.addTarget(self, action: #selector(self.backAction), for: .touchUpInside)

             self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
             
             
         
         
        
        // Do any additional setup after loading the view.
    }
    
    @objc func backAction(_ sender: UIButton) {
       let _ = self.dismiss(animated: true, completion: nil)
    }

    @IBAction func passwordBackButton(_ sender: UIBarButtonItem) {
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
