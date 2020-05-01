//
//  MainTabDataManager.swift
//  ios
//
//  Created by 조예은 on 2020/05/01.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class FindingGoodRestaurantDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
//    func getLocation(_ findingGoodRestaurantViewController: FindingGoodRestaurantViewController) {
//        Alamofire
//            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
//            .request("\(self.appDelegate.baseUrl)/districts", method: .get)
//            .validate()
//            .responseObject(completionHandler: { (response: DataResponse<LocationResponse>) in
//                switch response.result {
//                case .success(let locationResponse):
// 
//                    if locationResponse.code == 100 {
//                        return print("오류")
//                    }
//                    if locationResponse.code == 200 {
//                        findingGoodRestaurantViewController.locationButton.titleLabel = locationResponse.result[2].title
//                    }
//                case .failure:
//                    return print("서버와의 연결이 원활하지 않습니다.")
//                }
//            })
//    }
}
