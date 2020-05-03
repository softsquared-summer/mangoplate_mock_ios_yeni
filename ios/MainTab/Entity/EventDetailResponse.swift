//
//  EventResponse.swift
//  ios
//
//  Created by 조예은 on 2020/05/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct EventDetailResponse {
    var code: Int!
    var isSuccess: Bool!
    var result: [EventDetail]!
    var message: String!
    //var tutorials: [Tutorial?]!
}


extension EventDetailResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        isSuccess <- map["isSuccess"]
        result <- map["result"]
        message <- map["message"]

    }
    
}


struct EventDetail {
  
    var eventId: Int!
    var imageUrl: String!
    var title: String!
    var status: String!
    var date: String!

    
   
}

extension EventDetail: Mappable {

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

