//
//  EmailLoginViewController.swift
//  ios
//
//  Created by 조예은 on 2020/04/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class EmailLoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func findingPassword(_ sender: UIButton) {
        let lostPasswordvc = LostPasswordViewController() //change this to your class name
        lostPasswordvc.modalPresentationStyle = .fullScreen
        self.present(lostPasswordvc, animated: true, completion: nil)
    }
    
    
    @IBAction func signupByEmail(_ sender: UIButton) {
        let signupByEmailvc = SignUpByEmailViewController() //change this to your class name
        signupByEmailvc.modalPresentationStyle = .fullScreen
        self.present(signupByEmailvc, animated: true, completion: nil)
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
