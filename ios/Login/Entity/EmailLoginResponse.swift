//
//  EmailLoginRespose.swift
//  ios
//
//  Created by 조예은 on 2020/05/01.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//
import ObjectMapper

struct EmailLoginResponse {
    var isSuccess: Bool!
    var code: Int!
    var message: String!
    var result: EmailLogin!
}


extension EmailLoginResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        isSuccess <- map["isSuccess"]
        code <- map["code"]
        message <- map["message"]
        result <- map["result"]
    }
    
}


struct EmailLogin {
  
    var jwt: String!
   
}

extension EmailLogin: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        jwt <- map["jwt"]

    }

}

