//
//  RecentRegionViewController.swift
//  ios
//
//  Created by 조예은 on 2020/05/03.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class RecentRegionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true


        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func pressedSettingLocation(_ sender: UIButton) {
    self.dismiss(animated: false, completion: nil)

    }

}
