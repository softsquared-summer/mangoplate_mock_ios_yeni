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

class RestaurantsDataManager {
let headers: HTTPHeaders = ["x-access-token" : jwtKey]

    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getRestaurantsList(_ findingGoodRestaurantViewController: FindingGoodRestaurantViewController) {


        Alamofire
            .request("\(self.appDelegate.baseUrl)/restaurants?type=main&lat=\(latitude)&lng=\(longitude)", method: .get, headers: headers)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<RestaurantsResponse>) in
                switch response.result {
                case .success(let restaurantsResponse):
                    if (restaurantsResponse.code == 200) {
                    
                        for index in 0..<restaurantsResponse.result.count{
                            
                        findingGoodRestaurantViewController.restaurantsArea.insert(restaurantsResponse.result[index].area, at: index)
                            //식당 지역
                            
                            let RestaurantURL = URL(string: restaurantsResponse.result[index].img)!
                        findingGoodRestaurantViewController.restaurantsImage.insert(RestaurantURL, at: index)
                            //식당 이미지
//                            findingGoodRestaurantViewController.restaurantsStar.insert(restaurantsResponse.result[index].star, at: index)
                            //가고싶다
                            
                            findingGoodRestaurantViewController.restaurantsTitle.insert(restaurantsResponse.result[index].title, at: index)
                            //식당 이름
                            
                            findingGoodRestaurantViewController.restaurantsDistance.insert(restaurantsResponse.result[index].distance, at: index)
                            //식당 거리
                            
                            findingGoodRestaurantViewController.restaurantsSeenNum.insert(restaurantsResponse.result[index].seenNum, at: index)
                            //조회수
                            
                            findingGoodRestaurantViewController.restaurantsReviewNum.insert(String(restaurantsResponse.result[index].reviewNum), at: index)
                            //리뷰 수
                            
                            findingGoodRestaurantViewController.restaurantsRating.insert(String(restaurantsResponse.result[index].rating), at: index)
                            //평점
                            
                            findingGoodRestaurantViewController.restaurantsRatingColor.insert(restaurantsResponse.result[index].ratingColor, at: index)
                           //평점 색상
                        }
                        
                        findingGoodRestaurantViewController.setRestaurantList()
                        
                        
                        print("restaurantsResponse: \(restaurantsResponse.message)")
                        
                        print("restaurantsResponse: \(restaurantsResponse.result[0].title)")
                        print("restaurantsResponse: \(restaurantsResponse.result[1].img)")


                        
                    }
                    
                    else {
                       print("latitude:\(latitude), longitude:\(longitude)")
                        print("restaurantsResponse:\( restaurantsResponse.message)")
                    }
                case .failure:
                     print("서버와의 연결이 원활하지 않습니다.")
                }
            })
    }
    
    
}
