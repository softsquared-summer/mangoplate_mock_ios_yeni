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

class EatDealDataManager {
let headers: HTTPHeaders = ["x-access-token" : jwtKey]

    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getEatDealList(_ eatDealViewController: EatDealViewController) {


        Alamofire
            .request("\(self.appDelegate.baseUrl)/eatdeals", method: .get, headers: headers)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<EatDealResponse>) in
                switch response.result {
                case .success(let eatDealResponse):
                    if (eatDealResponse.code == 200) {
                    
                       
                            
                            let FirstEatDealURL = URL(string: eatDealResponse.result[0].imageUrl)
                            eatDealViewController.eatDealFirstImageView.kf.setImage(with: FirstEatDealURL)
                       eatDealViewController.eatDealFirstPriceLabel.text = "₩" + eatDealResponse.result[0].salePrice
                        
                        eatDealViewController.eatDealFirstTitleLabel.text = eatDealResponse.result[0].title
                        
                        eatDealViewController.eatDealFirstItemLabel.text = eatDealResponse.result[0].item
                        
                        let SecondEatDealURL = URL(string: eatDealResponse.result[1].imageUrl)
                             eatDealViewController.eatDealSecondImageView.kf.setImage(with: SecondEatDealURL)
                        eatDealViewController.eatDealSecondPriceLabel.text = "₩" + eatDealResponse.result[1].salePrice
                         
                         eatDealViewController.eatDealSecondTitleLabel.text = eatDealResponse.result[1].title
                         
                         eatDealViewController.eatDealSecondItemLabel.text = eatDealResponse.result[1].item
                        
                        let ThirdEatDealURL = URL(string: eatDealResponse.result[2].imageUrl)
                             eatDealViewController.eatDealThirdImageView.kf.setImage(with: ThirdEatDealURL)
                        eatDealViewController.eatDealThirdPriceLabel.text =  eatDealResponse.result[2].salePrice
                         
                         eatDealViewController.eatDealThirdTitleLabel.text = eatDealResponse.result[2].title
                         
                         eatDealViewController.eatDealThirdItemLabel.text = eatDealResponse.result[2].item
                        
                        eatDealViewController.eatDealThirdSoldOutLabel.text = eatDealResponse.result[2].quantity
                        
                        
                        let FourthEatDealURL = URL(string: eatDealResponse.result[3].imageUrl)
                             eatDealViewController.eatDealFourthImageView.kf.setImage(with: FourthEatDealURL)
                        eatDealViewController.eatDealFourthPriceLabel.text = "₩" + eatDealResponse.result[3].salePrice
                         
                         eatDealViewController.eatDealFourthTitleLabel.text = eatDealResponse.result[3].title
                         
                         eatDealViewController.eatDealFourthItemLabel.text = eatDealResponse.result[3].item
                        
                        let FifthEatDealURL = URL(string: eatDealResponse.result[4].imageUrl)
                             eatDealViewController.eatDealFifthImageView.kf.setImage(with: FifthEatDealURL)
                        eatDealViewController.eatDealFifthPriceLabel.text = "₩" + eatDealResponse.result[4].salePrice
                         
                         eatDealViewController.eatDealFifthTitleLabel.text = eatDealResponse.result[4].title
                         
                         eatDealViewController.eatDealFifthItemLabel.text = eatDealResponse.result[4].item
                        
                     
                            
                            
//                            let RestaurantsURL = URL(string: restaurantsResponse.result[index].img)!
//                            findingGoodRestaurantViewController.restaurantsImage.insert(RestaurantsURL, at: index)
                            //식당 이미지

                        
//                        findingGoodRestaurantViewController.setRestaurantList()
                        
                       
                        print("eatDealResponse: \(eatDealResponse.message)")
                        
                    
                        
                    }
                    
                    else {
                      
                        print("eatDealResponse:\( eatDealResponse.message)")
                    }
                case .failure:
                     print("서버와의 연결이 원활하지 않습니다.")
                }
            })
    }
    
    
}
