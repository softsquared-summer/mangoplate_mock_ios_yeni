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
    var result: [Restaurant?]!
    //var tutorials: [Tutorial?]!
}


extension RestaurantsResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        isSuccess <- map["isSuccess"]
        result <- map["result"]
    }
    
}


struct Restaurant {
  
    var nameB: String!
    var title: String!
    
   
}

extension Restaurant: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        nameB <- map["nameA"]
        title <- map["title"]

    }

}
