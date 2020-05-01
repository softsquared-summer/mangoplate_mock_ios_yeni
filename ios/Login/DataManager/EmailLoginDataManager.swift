//
//  SignUpByEmailDataManager.swift
//  ios
//
//  Created by 조예은 on 2020/05/01.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//


import Alamofire
import AlamofireObjectMapper

class EmailLoginDataManager: UIViewController{
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func postEmailLogin(_ emailLoginViewController: EmailLoginViewController, _ email: String, _ pw: String) {
        
        let parameter: Parameters = [
            "email": email,
            "pw": pw
        ]
        
        Alamofire
            .request("\(self.appDelegate.baseUrl)/jwt?type=email", method: .post, parameters: parameter, encoding: JSONEncoding.default)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<EmailLoginResponse>) in
                switch response.result {
                case .success(let emailLoginResponse):
                    
                    if emailLoginResponse.code == 200 {
                        print(emailLoginResponse.message)
                        EmailLoginViewController().presentMainTabVC()
                        
//                        let mainTabvc = MainTabViewController() //change this to your class name
//                                mainTabvc.modalPresentationStyle = .fullScreen

                        //        UIApplication.shared.delegate?.window!!.rootViewController?.present(mainTabvc, animated: true, completion: nil)

//                                self.present(mainTabvc, animated: true, completion: nil)
                        
                        
                        
                    } else {
                        emailLoginViewController.LoginResultLabel.text = "회원 정보를 불러오는데 실패하였습니다."
                    }
                case .failure:
                    emailLoginViewController.LoginResultLabel.text = "서버와의 연결이 원활하지 않습니다."
                }
            })
    }
    
  
}
