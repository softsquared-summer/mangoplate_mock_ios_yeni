//
//  SignUpByEmailDataManager.swift
//  ios
//
//  Created by 조예은 on 2020/05/01.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//


import Alamofire
import AlamofireObjectMapper

class SignUpByEmailDataManager{
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func postSignUpByEmail(_ signUpByEmailViewController: SignUpByEmailViewController, _ email: String, _ pw1: String, _ pw2: String, _ name: String) {
        
        let parameter: Parameters = [
            "email": email,
            "pw1": pw1,
            "pw2": pw2,
            "name": name

        ]
        
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            .request("\(self.appDelegate.baseUrl)/user", method: .post, parameters: parameter, encoding: JSONEncoding.default)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<SignUpByEmailResponse>) in
                switch response.result {
                case .success(let signUpByEmailResponse):
                    
                    if signUpByEmailResponse.code == 200 {
                        signUpByEmailViewController.signupResultLabel.text = ""
                        
                        let alert = UIAlertController(title: "성공", message: signUpByEmailResponse.message, preferredStyle: UIAlertController.Style.alert)
                        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                            signUpByEmailViewController.presentLoginVC()
                        }
                        alert.addAction(okAction)
                        
                        signUpByEmailViewController.present(alert, animated: false, completion: nil)
                        
                        
                        
                       
                    
                        
                    } else {
                        
                        if (signUpByEmailResponse.message == "잘못된 메일주소입니다. 다시 입력해주세요." ){
                            signUpByEmailViewController.emailMessage.text = signUpByEmailResponse.message
                        } else if (signUpByEmailResponse.message == "비밀번호를 다시 확인 해주세요"){
                            signUpByEmailViewController.password1Label.text = signUpByEmailResponse.message
                        } else if (signUpByEmailResponse.message == "비밀번호가 일치 하지 않습니다."){
                            signUpByEmailViewController.password2Label.text = signUpByEmailResponse.message
                        }
                    }
                case .failure:
                    signUpByEmailViewController.signupResultLabel.text = "서버와의 연결이 원활하지 않습니다."
                }
            })
    }
}
