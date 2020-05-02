//
//  SignUpByEmailDataManager.swift
//  ios
//
//  Created by 조예은 on 2020/05/01.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//


import Alamofire
import AlamofireObjectMapper

class SignUpByEmailDataManager {
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
                        signUpByEmailViewController.signupResultLabel.text = signUpByEmailResponse.message
                        
                        
                        signUpByEmailViewController.presentLoginVC()
                        
                       
                    
                        
                    } else {
                        signUpByEmailViewController.signupResultLabel.text = signUpByEmailResponse.message
//                        "회원가입 정보를 불러오는데 실패하였습니다."
                    }
                case .failure:
                    signUpByEmailViewController.signupResultLabel.text = "서버와의 연결이 원활하지 않습니다."
                }
            })
    }
}
