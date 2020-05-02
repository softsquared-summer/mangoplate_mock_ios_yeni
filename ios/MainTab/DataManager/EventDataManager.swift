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

class EventDataManager {
let headers: HTTPHeaders = ["x-access-token" : jwtKey]
//    var jwt = jwtKey
//    let headers = [
//       "Authorization" : String(format: "Bearer: @%", jwtKey)
//    ]
//    let headers = ["Authorization" : "Bearer "+jwtKey+"",
//    "Content-Type": "application/json"]
    
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getEvents(_ eventViewController: EventViewController) {
//        var header = [String: String]()
//        header["Authorization"] = "Bearer \(jwtKey)"

        Alamofire
            .request("\(self.appDelegate.baseUrl)/events?type=detail", method: .get, headers: headers)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<EventResponse>) in
                switch response.result {
                case .success(let eventResponse):
                    if (eventResponse.code == 200) {
//                        eventResponse.result.startIndex
                        
                        
                        let FirstEventURL = URL(string: eventResponse.result[2].imageUrl)!
                        let Firstdata = try! Data(contentsOf: FirstEventURL)
                        eventViewController.FirstEventImageView.image = UIImage(data: Firstdata)
                        
                       /* let FirstEventURL = URL(string: eventResponse.result[2].imageUrl)
                        eventViewController.FirstEventImageView.af_setImage(withURL: FirstEventURL)*/
//                        eventViewController.FirstEventImageView.image = UIImage(named: eventResponse.result[2].imageUrl)
                        eventViewController.FirstEventTitleLabel.text = eventResponse.result[2].title
                            
                        eventViewController.FirstEventDateLabel.text = eventResponse.result[2].date
                        
                        let SecondEventURL = URL(string: eventResponse.result[3].imageUrl)!
                        let Seconddata = try! Data(contentsOf: SecondEventURL)
                        eventViewController.SecondEventImageView.image = UIImage(data: Seconddata)
                        
                        eventViewController.SecondEventTitleLabel.text = eventResponse.result[3].title
                            
                        eventViewController.SecondEventDateLabel.text = eventResponse.result[3].date
                        
                        let ThirdEventURL = URL(string: eventResponse.result[0].imageUrl)!
                        let Thirddata = try! Data(contentsOf: SecondEventURL)
                        eventViewController.SecondEventImageView.image = UIImage(data: Thirddata)
                        
                        
                        eventViewController.ThirdEventTitleLabel.text = eventResponse.result[0].title
                            
                        eventViewController.ThirdEventDateLabel.text = eventResponse.result[0].date
                        
                        let FourthEventURL = URL(string: eventResponse.result[5].imageUrl)!
                        let Fourthdata = try! Data(contentsOf: SecondEventURL)
                        eventViewController.SecondEventImageView.image = UIImage(data: Fourthdata)
                        
                    
                        eventViewController.FourthEventTitleLabel.text = eventResponse.result[5].title
                            
                        eventViewController.FourthEventDateLabel.text = eventResponse.result[5].date
                        
                        let FifthEventURL = URL(string: eventResponse.result[4].imageUrl)!
                        let Fifthdata = try! Data(contentsOf: SecondEventURL)
                        eventViewController.SecondEventImageView.image = UIImage(data: Fifthdata)
                        
                        eventViewController.FifthEventTitleLabel.text = eventResponse.result[4].title
                            
                        eventViewController.FifthEventDateLabel.text = eventResponse.result[4].date
                        
                        let SixthEventURL = URL(string: eventResponse.result[1].imageUrl)!
                        let Sixthdata = try! Data(contentsOf: SecondEventURL)
                        eventViewController.SecondEventImageView.image = UIImage(data: Sixthdata)
                        
                        eventViewController.SixthEventTitleLabel.text = eventResponse.result[1].title
                            
                        eventViewController.SixthEventDateLabel.text = eventResponse.result[1].date
                     
                        print("eventResponse: \(eventResponse.message)")
                        print("eventResponse: \(eventResponse.result)")
                        
                        
                    }else {
                        print("eventResponse:\( eventResponse.message)")
                    }
                case .failure:
                     print("서버와의 연결이 원활하지 않습니다.")
                }
            })
    }
}
