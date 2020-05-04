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


class EventDetailDataManager {
let headers: HTTPHeaders = ["x-access-token" : jwtKey]
//    var jwt = jwtKey
//    let headers = [
//       "Authorization" : String(format: "Bearer: @%", jwtKey)
//    ]
//    let headers = ["Authorization" : "Bearer "+jwtKey+"",
//    "Content-Type": "application/json"]
    
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getDetailEvents(_ eventViewController: EventViewController) {
//        var header = [String: String]()
//        header["Authorization"] = "Bearer \(jwtKey)"

        Alamofire
            .request("\(self.appDelegate.baseUrl)/events?type=detail", method: .get, headers: headers)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<EventDetailResponse>) in
                switch response.result {
                case .success(let eventDetailResponse):
                    if (eventDetailResponse.code == 200) {
//                        eventResponse.result.startIndex
                        
                        let FirstEventURL = URL(string: eventDetailResponse.result[2].imageUrl)
                    eventViewController.FirstEventImageView.kf.setImage(with: FirstEventURL)
                        
                        
//                        let FirstEventURL = URL(string: eventDetailResponse.result[2].imageUrl)!
//                        let Firstdata = try! Data(contentsOf: FirstEventURL)
//                        eventViewController.FirstEventImageView.image = UIImage(data: Firstdata)
                        
                       /* let FirstEventURL = URL(string: eventResponse.result[2].imageUrl)
                        eventViewController.FirstEventImageView.af_setImage(withURL: FirstEventURL)*/
//                        eventViewController.FirstEventImageView.image = UIImage(named: eventResponse.result[2].imageUrl)
                        eventViewController.FirstEventTitleLabel.text = eventDetailResponse.result[2].title
                            
                        eventViewController.FirstEventDateLabel.text = eventDetailResponse.result[2].date
                        
                        let SecondEventURL = URL(string: eventDetailResponse.result[3].imageUrl)!
                        let Seconddata = try! Data(contentsOf: SecondEventURL)
                        eventViewController.SecondEventImageView.image = UIImage(data: Seconddata)
                        
                        eventViewController.SecondEventTitleLabel.text = eventDetailResponse.result[3].title
                            
                        eventViewController.SecondEventDateLabel.text = eventDetailResponse.result[3].date
                        
                        let ThirdEventURL = URL(string: eventDetailResponse.result[0].imageUrl)!
                        let Thirddata = try! Data(contentsOf: SecondEventURL)
                        eventViewController.SecondEventImageView.image = UIImage(data: Thirddata)
                        
                        
                        eventViewController.ThirdEventTitleLabel.text = eventDetailResponse.result[0].title
                            
                        eventViewController.ThirdEventDateLabel.text = eventDetailResponse.result[0].date
                        
                        let FourthEventURL = URL(string: eventDetailResponse.result[5].imageUrl)!
                        let Fourthdata = try! Data(contentsOf: SecondEventURL)
                        eventViewController.SecondEventImageView.image = UIImage(data: Fourthdata)
                        
                    
                        eventViewController.FourthEventTitleLabel.text = eventDetailResponse.result[5].title
                            
                        eventViewController.FourthEventDateLabel.text = eventDetailResponse.result[5].date
                        
                        let FifthEventURL = URL(string: eventDetailResponse.result[4].imageUrl)!
                        let Fifthdata = try! Data(contentsOf: SecondEventURL)
                        eventViewController.SecondEventImageView.image = UIImage(data: Fifthdata)
                        
                        eventViewController.FifthEventTitleLabel.text = eventDetailResponse.result[4].title
                            
                        eventViewController.FifthEventDateLabel.text = eventDetailResponse.result[4].date
                        
                        let SixthEventURL = URL(string: eventDetailResponse.result[1].imageUrl)!
                        let Sixthdata = try! Data(contentsOf: SecondEventURL)
                        eventViewController.SecondEventImageView.image = UIImage(data: Sixthdata)
                        
                        eventViewController.SixthEventTitleLabel.text = eventDetailResponse.result[1].title
                            
                        eventViewController.SixthEventDateLabel.text = eventDetailResponse.result[1].date
                     
                        print("eventResponse: \(eventDetailResponse.message)")
                        print("eventResponse: \(eventDetailResponse.result)")
                        
                        
                    }else {
                        print("eventResponse:\( eventDetailResponse.message)")
                    }
                case .failure:
                     print("서버와의 연결이 원활하지 않습니다.")
                }
            })
    }
}
