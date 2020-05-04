//
//  EventResponse.swift
//  ios
//
//  Created by 조예은 on 2020/05/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import ObjectMapper

struct LookUpMainEventResponse {
    var code: Int!
    var isSuccess: Bool!
    var result: LookUpMainEvent!
    var message: String!
    //var tutorials: [Tutorial?]!
}


extension LookUpMainEventResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        isSuccess <- map["isSuccess"]
        result <- map["result"]
        message <- map["message"]

    }
    
}


struct LookUpMainEvent {
  
    var eventId: Int!
    var imageUrl: String!
    

    
   
}

extension LookUpMainEvent: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        eventId <- map["eventId"]
        imageUrl <- map["imageUrl"]
        


    }

}

