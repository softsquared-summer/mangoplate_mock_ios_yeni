//
//  restaurants.swift
//  ios
//
//  Created by 조예은 on 2020/04/28.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct NearRegionListResponse {
    var code: Int!
    var isSuccess: Bool!
    var result: [NearRegionList]!
    var message: String!
}


extension NearRegionListResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        isSuccess <- map["isSuccess"]
        result <- map["result"]
        message <- map["message"]

    }
    
}


struct NearRegionList {
  
    var distinctsId: Int!
    var areaId: Int!
    var name: String!
    var distance: String!
    
   
}

extension NearRegionList: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        distinctsId <- map["distinctsId"]
        areaId <- map["areaId"]
        name <- map["name"]
        distance <- map["distance"]


    }

}
