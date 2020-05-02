//
//  SignUpByEmailViewController.swift
//  ios
//
//  Created by 조예은 on 2020/04/30.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class SignUpByEmailViewController: UIViewController {
    
    unowned var dataManager: SignUpByEmailDataManager {
        get {
            return SignUpByEmailDataManager()
        }
    }
   
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var password1Label: UITextField!
    @IBOutlet weak var password2Label: UITextField!
    @IBOutlet weak var nameLabel: UITextField!
    
    @IBOutlet weak var signupResultLabel: UILabel!
    
    @IBOutlet weak var presentLoginViewButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var backbutton = UIButton(type: .custom)
        backbutton.setImage(UIImage(named: "backBarButton.png"), for: .normal) // Image can be downloaded from here below link
        backbutton.setTitle("이메일로 가입", for: .normal)
        backbutton.tintColor = .black
        backbutton.setTitleColor(backbutton.tintColor, for: .normal) // You can change the TitleColor

        backbutton.addTarget(self, action: #selector(self.backAction), for: .touchUpInside)

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)

    
        // Do any additional setup after loading the view.
    }
    @objc func backAction(_ sender: UIButton) {
       let _ = self.dismiss(animated: true, completion: nil)
    }

//    @IBAction func signInBackButton(_ sender: UIBarButtonItem) {
//        self.dismiss(animated: true, completion: nil)
//
//    }

    @IBAction func pressedGetSingUpByEmail(_ sender: UIButton) {
        dataManager.postSignUpByEmail(self, emailLabel.text!, password1Label.text!, password2Label.text!, nameLabel.text!)
        
        
    }
    
    func presentLoginVC(){
        //성공했을때만 이동해야됨
        
        let loginvc = LoginViewController() //change this to your class name
        loginvc.modalPresentationStyle = .fullScreen

        UIApplication.shared.delegate?.window!!.rootViewController?.present(loginvc, animated: true, completion: nil)

        self.present(loginvc, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func pressedGetLoginVC(_ sender: UIButton) {
        
            let Loginvc = LoginViewController() //change this to your class name
            Loginvc.modalPresentationStyle = .fullScreen
            self.present(Loginvc, animated: true, completion: nil)
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
