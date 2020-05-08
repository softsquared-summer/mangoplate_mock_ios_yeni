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

class NearRegionListDataManager {
let headers: HTTPHeaders = ["x-access-token" : jwtKey]

    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getNearRegionList(_ nearViewController: NearViewController) {


        Alamofire
            .request("\(self.appDelegate.baseUrl)/near-districts?lat=\(latitude)&lng=\(longitude)", method: .get, headers: headers)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<NearRegionListResponse>) in
                switch response.result {
                case .success(let nearRegionListResponse):
                    if (nearRegionListResponse.code == 200) {
                    
                        for index in 0..<nearRegionListResponse.result.count{
                        
                        nearViewController.dongs.insert(nearRegionListResponse.result[index].name, at: index)
           
                            
                        }
                        nearViewController.setDongs()
                        
                        print("nearRegionListResponse: \(nearRegionListResponse.message)")
                        print("nearRegionListResponse: \(nearRegionListResponse.result[0].name)")
                        print("nearRegionListResponse: \(nearRegionListResponse.result[1].name)")


                        
                    }else {
                        print("nearRegionListResponse:\( nearRegionListResponse.message)")
                    }
                case .failure:
                     print("서버와의 연결이 원활하지 않습니다.")
                }
            })
    }
    
    func getCurrentLocation(_ findingGoodRestaurantViewController: FindingGoodRestaurantViewController) {


        Alamofire
            .request("\(self.appDelegate.baseUrl)/near-districts?lat=\(latitude)&lng=\(longitude)", method: .get, headers: headers)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<NearRegionListResponse>) in
                switch response.result {
                case .success(let nearRegionListResponse):
                    if (nearRegionListResponse.code == 200) {
                            
                        findingGoodRestaurantViewController.locationButton.setTitle(nearRegionListResponse.result[0].name, for: .normal)
                            
                 
    
                    }else {
                        print("nearRegionListResponse:\( nearRegionListResponse.message)")
                    }
                case .failure:
                     print("서버와의 연결이 원활하지 않습니다.")
                }
            })
    }
    
    
    
    
    
}
