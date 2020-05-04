//
//  MainDataManager.swift
//  ios
//
//  Created by Jerry Jung on 13/08/2019.
//  Copyright © 2019 Jerry Jung. All rights reserved.
//
import Alamofire
import AlamofireObjectMapper
import AlamofireImage
import Kingfisher



class LookUpMainEventDataManager {
let headers: HTTPHeaders = ["x-access-token" : jwtKey]

    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getLookUpMainEvent(_ mainEventViewController: MainEventViewController) {


        Alamofire
            .request("\(self.appDelegate.baseUrl)/event", method: .get, headers: headers)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<LookUpMainEventResponse>) in
                switch response.result {
                case .success(let lookUpMainEventResponse):
                    if (lookUpMainEventResponse.code == 200) {
                        
                        let MainEventURL = URL(string: lookUpMainEventResponse.result.imageUrl)
                        mainEventViewController.mainEventImageView.kf.setImage(with: MainEventURL)
                        
//                        eventResponse.result.startIndex
//                        let MainEventURL = URL(string: lookUpMainEventResponse.result.imageUrl)!
//                        let Maindata = try! Data(contentsOf: MainEventURL)
//                        mainEventViewController.mainEventImageView.image = UIImage(data: Maindata)
                        
                        
                       print("lookUpMainEventResponse: \(lookUpMainEventResponse.message)")
                      
                        
                    }else {
                        print("lookUpMainEventResponse:\( lookUpMainEventResponse.message)")
                    }
                case .failure:
                     print("서버와의 연결이 원활하지 않습니다.")
                }
            })
    }
}
