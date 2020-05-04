//
//  restaurants.swift
//  ios
//
//  Created by 조예은 on 2020/04/28.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct DistinctResponse {
    var code: Int!
    var isSuccess: Bool!
    var result: [Distinct]!
    var message: String!
}


extension DistinctResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        isSuccess <- map["isSuccess"]
        result <- map["result"]
        message <- map["message"]

    }
    
}


struct Distinct {
  
    var distinctsId: Int!
    var name: String!
    
   
}

extension Distinct: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        distinctsId <- map["distinctsId"]
        name <- map["name"]

    }

}
