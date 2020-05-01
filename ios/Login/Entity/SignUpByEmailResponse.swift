//
//  SignUpByEmailResponse.swift
//  ios
//
//  Created by 조예은 on 2020/05/01.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct SignUpByEmailResponse {
    var isSuccess: Bool!
    var code: Int!
    var message: String!
    var result: [SignUpByEmail?]!
    //var tutorials: [Tutorial?]!
}


extension SignUpByEmailResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        isSuccess <- map["isSuccess"]
        code <- map["code"]
        message <- map["message"]
        result <- map["result"]
    }
    
}


struct SignUpByEmail {
  
    var userId: Int!
   
}

extension SignUpByEmail: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        userId <- map["userId"]

    }

}
