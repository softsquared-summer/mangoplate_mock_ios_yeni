//
//  restaurants.swift
//  ios
//
//  Created by 조예은 on 2020/04/28.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct RestaurantsResponse {
    var code: Int!
    var isSuccess: Bool!
    var result: [Restaurants]!
    var message: String!
}


extension RestaurantsResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        isSuccess <- map["isSuccess"]
        result <- map["result"]
        message <- map["message"]

    }
    
}


struct Restaurants {
  
    var areaId: Int!
    var area: String!
    var restaurantId: Int!
    var img: String!
    var star: String!
    var title: String!
    var distance: String!
    var seenNum: String!
    var reviewNum: Int!
    var rating: Float!
    var ratingColor: String!

    
   
}

extension Restaurants: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        areaId <- map["areaId"]
        area <- map["area"]
        restaurantId <- map["restaurantId"]
        img <- map["img"]
        star <- map["star"]
        title <- map["title"]
        distance <- map["distance"]
        seenNum <- map["seenNum"]
        reviewNum <- map["reviewNum"]
        rating <- map["rating"]
        ratingColor <- map["ratingColor"]



    }

}
