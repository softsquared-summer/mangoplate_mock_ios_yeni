//
//  restaurants.swift
//  ios
//
//  Created by 조예은 on 2020/04/28.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct EatDealResponse {
    var code: Int!
    var isSuccess: Bool!
    var result: [EatDeal]!
    var message: String!
}


extension EatDealResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        isSuccess <- map["isSuccess"]
        result <- map["result"]
        message <- map["message"]

    }
    
}


struct EatDeal {
  
    var eatdealId: Int!
    var areaId: Int!
    var imageUrl: String!
    var title: String!
    var item: String!
    var description: String!
    var quantity: String!
    var salePrice: String!
    
    
   
}

extension EatDeal: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        eatdealId <- map["eatdealId"]
        areaId <- map["areaId"]
        imageUrl <- map["imageUrl"]
        title <- map["title"]
        item <- map["item"]
        description <- map["description"]
        quantity <- map["quantity"]
        salePrice <- map["salePrice"]

       



    }

}
