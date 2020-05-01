//
//  LoginViewController.swift
//  ios
//
//  Created by 조예은 on 2020/04/24.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController {

    @IBOutlet weak var testBtn: UIButton!//메인으로 넘어가는 거 테스트위해 임시로 만들어둔 버튼(로그인 기능으로 화면이 메인으로 넘어가는게 가능해지면 그때 지움
    
    
    @IBAction func goToMainTest(_ sender: UIButton) {
        let mainTabvc = MainTabViewController() //change this to your class name
        mainTabvc.modalPresentationStyle = .fullScreen
        self.present(mainTabvc, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func emailLoginButton(_ sender: UIButton) {
//        let emailLoginVC = EmailLoginViewController()
        let emailLoginViewController: UINavigationController = UINavigationController(rootViewController: EmailLoginViewController())
        emailLoginViewController.modalPresentationStyle = .fullScreen

        self.present(emailLoginViewController, animated: true, completion: nil)
//
//        let emailLoginvc = EmailLoginViewController() //change this to your class name
//        emailLoginvc.modalPresentationStyle = .fullScreen
//        self.present(emailLoginvc, animated: true, completion: nil)
//        // 네비게이션바 화면으로 이동
       
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        navigationController?.isNavigationBarHidden = true


        // Do any additional setup after loading the view.
    }
    
    private let kakaoLoginButton: KOLoginButton = {
      let kakaobutton = KOLoginButton()
      kakaobutton.addTarget(self, action: #selector(touchUpLoginButton(_:)), for: .touchUpInside)
      kakaobutton.translatesAutoresizingMaskIntoConstraints = false
        kakaobutton.setTitle("카카오톡으로 시작하기", for: .normal)

      return kakaobutton
        
    }()
    
 
    
    private let facebookLoginButton : FBLoginButton = {
      let facebookbutton = FBLoginButton()
      facebookbutton.translatesAutoresizingMaskIntoConstraints = false
        var titleText = NSAttributedString(string: "페이스북으로 시작하기")
        facebookbutton.setAttributedTitle(titleText, for: UIControl.State.normal)

//        facebookbutton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center


      return facebookbutton

    }()
    
    @objc private func touchUpLoginButton(_ sender: UIButton) {
        
        let ud = UserDefaults.standard
        
      guard let session = KOSession.shared() else {
        return
      }
      
      if session.isOpen() {
        session.close()
      }
      
      session.open { (error) in
        if error != nil || !session.isOpen() { return }
        KOSessionTask.userMeTask(completion: { (error, profile) in
            
            let kakao = profile!
            ud.set(kakao.properties!["nickname"], forKey: "nickname")
//          guard let user = user,
//                let email = user.account?.email,
//
//                let nickname = user.nickname else { return }
          
        })
      }
    }
    private func layout() {
       let guide = view.safeAreaLayoutGuide
//        let facebookLoginButton = FBLoginButton()
        
       view.addSubview(kakaoLoginButton)
        view.addSubview(facebookLoginButton)
       
       kakaoLoginButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 75).isActive = true
       kakaoLoginButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -75).isActive = true
       kakaoLoginButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -317).isActive = true
       kakaoLoginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        if let facebookButtonHeightConstraint = facebookLoginButton.constraints.first(where: { $0.firstAttribute == .height }) {
            facebookLoginButton.removeConstraint(facebookButtonHeightConstraint)
        }
        facebookLoginButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 75).isActive = true
        facebookLoginButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -75).isActive = true
        kakaoLoginButton.topAnchor.constraint(equalTo: facebookLoginButton.bottomAnchor, constant: 10).isActive = true
        facebookLoginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

//질문

     }

    // Swift override func viewDidLoad() { super.viewDidLoad() if let token = AccessToken.current, !token.isExpired { // User is logged in, do work such as go to next view controller. } } //현재 로그인 상태 확인

    // Swift // // Extend the code sample from 6a. Add Facebook Login to Your Code // Add to your viewDidLoad method: loginButton.permissions = ["public_profile", "email"] //Facebook 로그인 버튼의 읽기 권한
        




    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
