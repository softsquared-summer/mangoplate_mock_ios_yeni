//
//  EventResponse.swift
//  ios
//
//  Created by 조예은 on 2020/05/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct EventMainResponse {
    var code: Int!
    var isSuccess: Bool!
    var result: [EventMain]!
    var message: String!
    //var tutorials: [Tutorial?]!
}


extension EventMainResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        isSuccess <- map["isSuccess"]
        result <- map["result"]
        message <- map["message"]

    }
    
}


struct EventMain {
  
    var eventId: Int!
    var imageUrl: String!

}

extension EventMain: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        eventId <- map["eventId"]
        imageUrl <- map["imageUrl"]

    }

}

