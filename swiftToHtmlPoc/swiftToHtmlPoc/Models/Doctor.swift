//
//  Doctor.swift
//  swiftToHtmlPoc
//
//  Created by Quagnitia on 6/12/19.
//  Copyright © 2019 Quagnitia. All rights reserved.
//

import Foundation

struct Doctor: Encodable {
    let speciality: String
    let name:String
    let address: String
    let website: String
    let medicalPracticeName: String
    let inNetworkStatus:String
    let lastSceen:String
    let electronicHealthRecordLink:String
    let notes:String
    let contact1:String
    let contact2:String

   private static func mockResultsFromDatabase() -> [Doctor] {
        let doc1 = Doctor(speciality: "Gynechologist",name:"Dr Jill Fishbane-Mayer-Gyno", address: "4 East 95th St 1a NY NY USA", website: String(), medicalPracticeName: String(), inNetworkStatus: String(), lastSceen: String(), electronicHealthRecordLink: String(), notes: String(), contact1: "Office:(212) 348-1111", contact2: "Mobile:(212)348-1111")

        let doc2 = Doctor(speciality: "Neurologist",name:"Dr Jack Fishbane-Mayer-Gyno" ,address: "4 West 95th St 1a NY NY USA", website: String(), medicalPracticeName: String(), inNetworkStatus: String(), lastSceen: String(), electronicHealthRecordLink: String(), notes: String(), contact1: "Office:(212) 348-1111", contact2: "Mobile:(212)348-1111")

        return [doc1, doc2]
    }

   static func getMockDoctorResponse() -> [[String:Any]] {
        var dictionaryCollection:[[String:Any]] = []
        let result = mockResultsFromDatabase()
        for item in result {
           try! dictionaryCollection.append(item.toDictionary())
        }
        return dictionaryCollection
    }
}
