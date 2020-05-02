//
//  EventResponse.swift
//  ios
//
//  Created by 조예은 on 2020/05/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct EventResponse {
    var code: Int!
    var isSuccess: Bool!
    var result: [Event]!
    var message: String!
    //var tutorials: [Tutorial?]!
}


extension EventResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        isSuccess <- map["isSuccess"]
        result <- map["result"]
        message <- map["message"]

    }
    
}


struct Event {
  
    var eventId: Int!
    var imageUrl: String!
    var title: String!
    var status: String!
    var date: String!

    
   
}

extension Event: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        eventId <- map["eventId"]
        imageUrl <- map["imageUrl"]
        title <- map["title"]
        status <- map["status"]
        date <- map["date"]


    }

}

