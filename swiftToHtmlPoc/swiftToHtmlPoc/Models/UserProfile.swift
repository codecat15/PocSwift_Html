//
//  UserProfile.swift
//  swiftToHtmlPoc
//
//  Created by Quagnitia on 6/12/19.
//  Copyright © 2019 Quagnitia. All rights reserved.
//

import Foundation

struct UserProfile: Encodable {
    let name: String
    let relationship: String
    let address: String
    let email: String
    let gender: String
    let birthDate: String
    let weight: String
    let height: String
    let languageSpoken:String
    let eyes: String
    let liveAlone: String
    let understandEnglish: String
    let pets:String

    static func getMockUserProfileResponse() -> [String:Any] {
        return try! UserProfile(name: "Tony Stark", relationship: "Single", address: "San jose 123", email: "toney@starkIndustries.com", gender: "Male", birthDate: "1-1-1985", weight: "150", height: "5-2", languageSpoken: "English",eyes: "Brown", liveAlone: "No", understandEnglish: "Yes",pets: "Yes").toDictionary()
    }
}
