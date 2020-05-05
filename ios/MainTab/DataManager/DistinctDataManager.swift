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

class DistinctDataManager {
let headers: HTTPHeaders = ["x-access-token" : jwtKey]
//    var jwt = jwtKey
//    let headers = [
//       "Authorization" : String(format: "Bearer: @%", jwtKey)
//    ]
//    let headers = ["Authorization" : "Bearer "+jwtKey+"",
//    "Content-Type": "application/json"]
    
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getDistincts(_ locationPopUp: LocationPopUp) {


        Alamofire
            .request("\(self.appDelegate.baseUrl)/districts", method: .get, headers: headers)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<DistinctResponse>) in
                switch response.result {
                case .success(let distinctResponse):
                    if (distinctResponse.code == 200) {
                    
                        
//                        eventResponse.result.startIndex
                        
//                        var gangNamTabBarItemTitle = districtResponse.result[0]?.name
//
//                        var gangBukTabBarItemTitle = districtResponse.result[1]?.name
//
//
//                        var gangNamDistrictsId = districtResponse.result[0]?.distinctsId
//                        var gangBukDistrictsId = districtResponse.result[1]?.distinctsId
//                        locationPopUp.setDistincts(distinctResponse.result[0].name, distinctResponse.result[1].name)
                        
                        print("distinctResponse: \(distinctResponse.message)")
                        print("distinctResponse: \(distinctResponse.result[0].name)")
                        print("distinctResponse: \(distinctResponse.result[1].name)")


                        
                    }else {
                        print("distinctsIdResponse:\( distinctResponse.message)")
                    }
                case .failure:
                     print("서버와의 연결이 원활하지 않습니다.")
                }
            })
    }
    
    
     func getGangNamGuRegionList(_ gangNamGuViewController: GangNamGuViewController) {


            Alamofire
                .request("\(self.appDelegate.baseUrl)/districts/1", method: .get, headers: headers)
                .validate()
                .responseObject(completionHandler: { (response: DataResponse<DistinctResponse>) in
                    switch response.result {
                    case .success(let distinctResponse):
                        if (distinctResponse.code == 200) {
                           
                            for index in 0..<26{
                            
                            gangNamGuViewController.dongs.insert(distinctResponse.result[index].name, at: index)
                            
                            }
                            gangNamGuViewController.setDongs()

                            print("distinctResponse: \(distinctResponse.message)")
                            print("distinctResponse: \(distinctResponse.result[0].name)")
                            print("distinctResponse: \(distinctResponse.result[1].name)")


                            
                        }else {
                            print("distinctsIdResponse:\( distinctResponse.message)")
                        }
                    case .failure:
                         print("서버와의 연결이 원활하지 않습니다.")
                    }
                })
        }
    
    
    
    
     func getGangBukGuRegionList(_ gangBukGuViewController: GangBukGuViewController) {


            Alamofire
                .request("\(self.appDelegate.baseUrl)/districts/2", method: .get, headers: headers)
                .validate()
                .responseObject(completionHandler: { (response: DataResponse<DistinctResponse>) in
                    switch response.result {
                    case .success(let distinctResponse):
                        if (distinctResponse.code == 200) {
                        
                            for index in 0..<25{
                            
                            gangBukGuViewController.dongs.insert(distinctResponse.result[index].name, at: index)
                            
                            }
                            gangBukGuViewController.setDongs()
                            
 
                            
                            print("distinctResponse: \(distinctResponse.message)")
                            print("distinctResponse: \(distinctResponse.result[0].name)")
                            print("distinctResponse: \(distinctResponse.result[1].name)")


                            
                        }else {
                            print("distinctsIdResponse:\( distinctResponse.message)")
                        }
                    case .failure:
                         print("서버와의 연결이 원활하지 않습니다.")
                    }
                })
        }
    
    
    
    




func getEatDealGangNamGuRegionList(_ eatDealGangNamGuViewController: EatDealGangNamGuViewController) {


            Alamofire
                .request("\(self.appDelegate.baseUrl)/districts/1", method: .get, headers: headers)
                .validate()
                .responseObject(completionHandler: { (response: DataResponse<DistinctResponse>) in
                    switch response.result {
                    case .success(let distinctResponse):
                        if (distinctResponse.code == 200) {
                           
                            for index in 0..<26{
                            
                            eatDealGangNamGuViewController.dongs.insert(distinctResponse.result[index].name, at: index)
                            
                            }
                            eatDealGangNamGuViewController.setDongs()

                            print("distinctResponse: \(distinctResponse.message)")
                            print("distinctResponse: \(distinctResponse.result[0].name)")
                            print("distinctResponse: \(distinctResponse.result[1].name)")


                            
                        }else {
                            print("distinctsIdResponse:\( distinctResponse.message)")
                        }
                    case .failure:
                         print("서버와의 연결이 원활하지 않습니다.")
                    }
                })
        }
    
    
    
    
     func getEatDealGangBukGuRegionList(_ eatDealGangBukGuViewController: EatDealGangBukGuViewController) {
            Alamofire
                .request("\(self.appDelegate.baseUrl)/districts/2", method: .get, headers: headers)
                .validate()
                .responseObject(completionHandler: { (response: DataResponse<DistinctResponse>) in
                    switch response.result {
                    case .success(let distinctResponse):
                        if (distinctResponse.code == 200) {
                        
                            for index in 0..<25{
                            
                            eatDealGangBukGuViewController.dongs.insert(distinctResponse.result[index].name, at: index)
                            
                            }
                            eatDealGangBukGuViewController.setDongs()
                            
 
                            
                            print("distinctResponse: \(distinctResponse.message)")
                            print("distinctResponse: \(distinctResponse.result[0].name)")
                            print("distinctResponse: \(distinctResponse.result[1].name)")


                            
                        }else {
                            print("distinctsIdResponse:\( distinctResponse.message)")
                        }
                    case .failure:
                         print("서버와의 연결이 원활하지 않습니다.")
                    }
                })
        }
    
}
    


