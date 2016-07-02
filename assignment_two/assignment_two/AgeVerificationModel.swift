//
//  AgeVerificationModel.swift
//  assignment_two
//
//  Created by Shena Yoshida on 7/2/16.
//  Copyright © 2016 Shena Yoshida. All rights reserved.
//

import Foundation

class AgeVerification {
    
    func verify(age: Int) -> String {
        let response: String
        
        switch age {
        case (0):
            response = "You are unborn"
        case (1...15):
            response = "You are a child"
        case (16...17):
            response = "You can drive"
        case (18...20):
            response = "you can drive and vote"
        case (21...100):
            response = "You can drink, drive and vote."
        default:
            response = "You are so old."
        }
        return response
    }
}



