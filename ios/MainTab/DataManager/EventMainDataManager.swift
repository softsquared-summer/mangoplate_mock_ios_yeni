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




class EventMainDataManager {
let headers: HTTPHeaders = ["x-access-token" : jwtKey]
//    var jwt = jwtKey
//    let headers = [
//       "Authorization" : String(format: "Bearer: @%", jwtKey)
//    ]
//    let headers = ["Authorization" : "Bearer "+jwtKey+"",
//    "Content-Type": "application/json"]
    
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getMainEvents(_ findingGoodRestaurantVC: FindingGoodRestaurantViewController) {
//        var header = [String: String]()
//        header["Authorization"] = "Bearer \(jwtKey)"

        Alamofire
            .request("\(self.appDelegate.baseUrl)/events?type=main", method: .get, headers: headers)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<EventMainResponse>) in
                switch response.result {
                case .success(let eventMainResponse):
                    if (eventMainResponse.code == 200) {
                        
                        let FirstEventURL = URL(string: eventMainResponse.result[0].imageUrl)!
                        findingGoodRestaurantVC.images.insert(FirstEventURL, at: 0)
                        
                        let SecondEventURL = URL(string: eventMainResponse.result[1].imageUrl)!
                        findingGoodRestaurantVC.images.insert(SecondEventURL, at: 1)
                        
                        let ThirdEventURL = URL(string: eventMainResponse.result[2].imageUrl)!
                        findingGoodRestaurantVC.images.insert(ThirdEventURL, at: 2)
                        
                         let FourthEventURL = URL(string: eventMainResponse.result[3].imageUrl)!
                        findingGoodRestaurantVC.images.insert(FourthEventURL, at: 3)
//                        findingGoodRestaurantVC.images.append(eventMainResponse.result[1].imageUrl)
//                        findingGoodRestaurantVC.images.append(eventMainResponse.result[2].imageUrl)
//                        findingGoodRestaurantVC.images.append(eventMainResponse.result[3].imageUrl)
                                
                        
                        
                        
                       //이미지 받아오는 부분 구현하기...
                        
                       
                        print("eventResponse: \(eventMainResponse.message)")
                        
                        
                    }else {
                        print("eventResponse:\( eventMainResponse.message)")
                    }
                case .failure:
                     print("서버와의 연결이 원활하지 않습니다.")
                }
            })
    }
}
