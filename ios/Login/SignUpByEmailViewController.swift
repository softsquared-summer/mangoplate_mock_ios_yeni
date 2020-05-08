//
//  SignUpByEmailViewController.swift
//  ios
//
//  Created by 조예은 on 2020/04/30.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

var nameLabel : String = ""

class SignUpByEmailViewController: UIViewController, UITextFieldDelegate {
    
    unowned var dataManager: SignUpByEmailDataManager {
        get {
            return SignUpByEmailDataManager()
        }
    }
//    private func addKeyboardNotification() {
//      NotificationCenter.default.addObserver(
//        self,
//        selector: #selector(keyboardWillShow),
//        name: UIResponder.keyboardWillShowNotification,
//        object: nil
//      )
//
//      NotificationCenter.default.addObserver(
//        self,
//        selector: #selector(keyboardWillHide),
//        name: UIResponder.keyboardWillHideNotification,
//        object: nil
//      )
//    }
   
    @IBOutlet weak var emaillAuthenticationButton: UIButton!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var password1Label: UITextField!
    @IBOutlet weak var password2Label: UITextField!
    
    @IBOutlet weak var signupResultLabel: UILabel!
    
    
    @IBOutlet weak var emailMessage: UILabel!
    
    @IBOutlet weak var password1Message: UILabel!
    
    @IBOutlet weak var password2Message: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        password1Label.delegate = self
//        password2Label.delegate = self
//
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
//
//        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(password1LabelendEditing)))
//        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(password2LabelendEditing)))

        
        var backImage = UIImage(named: "ic_right_arrow.png")
        
        var backbutton = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(self.backAction))
        backbutton.tintColor = .darkGray
        var lefttitle = UIBarButtonItem()
        lefttitle.title = "이메일로 가입"
        lefttitle.tintColor = .darkGray
//        lefttitle.style = .bordered

        let attributes: [NSAttributedString.Key : Any] = [ .font: UIFont.boldSystemFont(ofSize: 17) ]
        lefttitle.setTitleTextAttributes(attributes, for: .normal)

        navigationItem.leftBarButtonItems = [backbutton, lefttitle]

//        self.navigationItem.title = "이메일로 가입"
        
        var closeImage = UIImage(named: "ic_email_close.png")
         
         var closebutton = UIBarButtonItem(image: closeImage, style: .plain, target: self, action: #selector(self.closeAction))
        closebutton.tintColor = .darkGray

         navigationItem.rightBarButtonItem = closebutton
        


//
//        var backbutton = UIButton(type: .custom)
//        backbutton.setImage(UIImage(named: "ic_right_arrow.png"), for: .normal) // Image can be downloaded from here below link
//        backbutton.setTitle("   이메일로 가입", for: .normal)
//        backbutton.tintColor = .black
//        backbutton.setTitleColor(backbutton.tintColor, for: .normal) // You can change the TitleColor
//
//        backbutton.addTarget(self, action: #selector(self.backAction), for: .touchUpInside)
//
//
        
//        var closebutton = UIButton(type: .custom)
//         backbutton.setImage(UIImage(named: "ic_email_close.png"), for: .normal)
//         closebutton.addTarget(self, action: #selector(self.closeAction), for: .touchUpInside)
//
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
//         self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: closebutton)

    
        emaillAuthenticationButton.layer.cornerRadius = 24
        self.navigationController?.navigationBar.barTintColor = .white

        // Do any additional setup after loading the view.
    }
    
//    @objc private func keyboardWillShow(_ notification: Notification) {
//      if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
//        let keybaordRectangle = keyboardFrame.cgRectValue
//        let keyboardHeight = keybaordRectangle.height
//        password1Label.frame.origin.y -= keyboardHeight
//      }
//    }
//      
//    @objc private func keyboardWillHide(_ notification: Notification) {
//      if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
//        let keybaordRectangle = keyboardFrame.cgRectValue
//        let keyboardHeight = keybaordRectangle.height
//        password1Label.frame.origin.y += keyboardHeight
//      }
//    }
//    
//    @objc func password1LabelendEditing(){
//    password1Label.resignFirstResponder()
//
//    }
//    @objc func password2LabelendEditing(){
//    password2Label.resignFirstResponder()
//
//    }
//
//    @objc func keyboardWillShow(_ sender: Notification) {
//
//         self.view.frame.origin.y = -150 // Move view 150 points upward
//
//        }
//    @objc func keyboardWillHide(_ sender: Notification) {
//    self.view.frame.origin.y = 0 // Move view to original position
//    }
//
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//            textField.resignFirstResponder()
//     return true
//    }


    override func viewDidLayoutSubviews() {
        emailLabel.borderStyle = .none
        let emailBorder = CALayer()
        emailBorder.frame = CGRect(x: 0, y: emailLabel.frame.size.height-1, width: emailLabel.frame.width, height: 1)
        emailBorder.backgroundColor = UIColor.white.cgColor
        emailLabel.layer.addSublayer((emailBorder))
        emailLabel.textColor = UIColor.lightGray
        
        password1Label.borderStyle = .none
        let password1Border = CALayer()
        password1Border.frame = CGRect(x: 0, y: password1Label.frame.size.height-1, width: password1Label.frame.width, height: 1)
        password1Border.backgroundColor = UIColor.white.cgColor
        password2Label.layer.addSublayer((password1Border))
        password2Label.textColor = UIColor.lightGray
        
        password2Label.borderStyle = .none
        let password2Border = CALayer()
        password2Border.frame = CGRect(x: 0, y: password2Label.frame.size.height-1, width: password2Label.frame.width, height: 1)
        password2Border.backgroundColor = UIColor.white.cgColor
        password2Label.layer.addSublayer((password2Border))
        password2Label.textColor = UIColor.lightGray
    }
    
    
    @objc func backAction(_ sender: UIButton) {
       let _ = self.dismiss(animated: true, completion: nil)
    }
    
    @objc func closeAction(_ sender: UIButton) {
       let loginvc = LoginViewController() //change this to your class name
       loginvc.modalPresentationStyle = .fullScreen

       UIApplication.shared.delegate?.window!!.rootViewController?.present(loginvc, animated: true, completion: nil)

       self.present(loginvc, animated: true, completion: nil)
    }

//    @IBAction func signInBackButton(_ sender: UIBarButtonItem) {
//        self.dismiss(animated: true, completion: nil)
//
//    }

    @IBAction func pressedGetSingUpByEmail(_ sender: UIButton) {
        dataManager.postSignUpByEmail(self, emailLabel.text!, password1Label.text!, password2Label.text!, nameLabel)
        
        
    }
    
    func presentLoginVC(){
        //성공했을때만 이동해야됨
        
        let loginvc = LoginViewController() //change this to your class name
        loginvc.modalPresentationStyle = .fullScreen

        UIApplication.shared.delegate?.window!!.rootViewController?.present(loginvc, animated: true, completion: nil)

        self.present(loginvc, animated: true, completion: nil)
    }
    
    
    
    
//    @IBAction func pressedGetLoginVC(_ sender: UIButton) {
//        
//            let Loginvc = LoginViewController() //change this to your class name
//            Loginvc.modalPresentationStyle = .fullScreen
//            self.present(Loginvc, animated: true, completion: nil)
//    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
