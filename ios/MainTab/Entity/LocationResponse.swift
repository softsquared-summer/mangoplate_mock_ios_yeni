//
//  restaurants.swift
//  ios
//
//  Created by 조예은 on 2020/04/28.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct LocationResponse {
    var code: Int!
    var isSuccess: Bool!
    var result: [LocationTest?]!
    var message: String!
}


extension LocationResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        isSuccess <- map["isSuccess"]
        result <- map["result"]
        message <- map["message"]

    }
    
}


struct LocationTest {
  
    var districtsId: Int!
    var name: String!
    
   
}

extension LocationTest: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        districtsId <- map["districtsId"]
        name <- map["name"]

    }

}
