//
//  EmailLoginViewController.swift
//  ios
//
//  Created by 조예은 on 2020/04/29.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class EmailLoginViewController: UIViewController {
    
    unowned var dataManager: EmailLoginDataManager {
        get {
            return EmailLoginDataManager()
        }
    }
    
 
    @IBOutlet weak var emailTextFiled: UITextField!
    
    @IBOutlet weak var passwordTextFiled: UITextField!
    
    @IBOutlet weak var LoginResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.backBarButtonItem = UIBarButtonItem(
//        title: "이메일로 로그인", style: .plain, target: nil, action: nil)
//        let backButton = UIBarButtonItem()
//        backButton.title = "이메일로 로그인"
//        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        //네비게이션 바 백그라운드 컬러 흰색으로 바꾸기
        var backbutton = UIButton(type: .custom)
        backbutton.setImage(UIImage(named: "ic_left_arrow_gray.png"), for: .normal) // Image can be downloaded from here below link
        backbutton.setTitle("이메일로 로그인", for: .normal)
        backbutton.tintColor = .black
//        backbutton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        backbutton.setTitleColor(backbutton.tintColor, for: .normal) // You can change the TitleColor

        backbutton.addTarget(self, action: #selector(self.backAction), for: .touchUpInside)

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        
        
    }
    
   @objc func backAction(_ sender: UIButton) {
      let _ = self.dismiss(animated: true, completion: nil)
   }
    
    
    
    @IBAction func pressedGetMainTabVC(_ sender: UIButton) {
        
        dataManager.postEmailLogin(self, emailTextFiled.text!, passwordTextFiled.text!)
    
    }
    
    func presentMainTabVC(){
        //근데 neverSeeAgainButton(다시 보지 않음 버튼) 누르면 이 함수에서 그 버튼이 눌렸다는걸 인지해서 MainEventViewController를 띄우지 않아야하는건데 그부분을 하려면 앱 자동로그인이라던지 그런게 되어있어야 가능한 부분같다. 그 부분을 구현할쯤 이 부분 구현하기
        let mainEventvc = MainEventViewController() //change this to your class name
        mainEventvc.modalPresentationStyle = .fullScreen

        UIApplication.shared.delegate?.window!!.rootViewController?.present(mainEventvc, animated: true, completion: nil)

        self.present(mainEventvc, animated: true, completion: nil)
    }
    
    @IBAction func findingPassword(_ sender: UIButton) {
//        let lostPasswordvc = LostPasswordViewController() //change this to your class name
//        lostPasswordvc.modalPresentationStyle = .fullScreen
//        self.present(lostPasswordvc, animated: true, completion: nil)
//         let passwordnavigation = self.navigationController
//        passwordnavigation!.pushViewController(LostPasswordViewController(), animated: true)
        let lostPasswordVC = LostPasswordViewController()
        let lostPasswordViewController: UINavigationController = UINavigationController(rootViewController: LostPasswordViewController())
        lostPasswordViewController.modalPresentationStyle = .fullScreen

        self.present(lostPasswordViewController, animated: true, completion: nil)
        //네비게이션 바 생성
        
//        let lostPasswordVC = UINavigationController(rootViewController: LostPasswordViewController())

    }
    
    
    @IBAction func signupByEmail(_ sender: UIButton) {
        let signupVC = SignUpByEmailViewController()
              let signupViewController: UINavigationController = UINavigationController(rootViewController: SignUpByEmailViewController())
              signupViewController.modalPresentationStyle = .fullScreen

              self.present(signupViewController, animated: true, completion: nil)
        
//        let signupByEmailvc = SignUpByEmailViewController() //change this to your class name
//        signupByEmailvc.modalPresentationStyle = .fullScreen
//        self.present(signupByEmailvc, animated: true, completion: nil)
//        let signUpByEmailVC = UINavigationController(rootViewController: SignUpByEmailViewController())

        
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
