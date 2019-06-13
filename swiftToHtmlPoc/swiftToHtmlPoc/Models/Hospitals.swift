//
//  Hospitals.swift
//  swiftToHtmlPoc
//
//  Created by Quagnitia on 6/12/19.
//  Copyright © 2019 Quagnitia. All rights reserved.
//

import Foundation

struct Hospitals: Encodable{
    let category : String
    let name : String
    let address: String
    let website: String
    let inNetworkStatus:String
    let lastSceen:String
    let electronicHealthCarePatientPortal:String
    let notes:String
    let contact1:String

    private static func mockResultsFromDatabase() -> [Hospitals] {
        let hosp1 = Hospitals(category: "Home health care agency", name: "Simon home care", address: "324 Broadway NYC", website: "SHC.com", inNetworkStatus: "No Aetna", lastSceen: String(), electronicHealthCarePatientPortal: String(), notes: String(), contact1: "Office: 718-565-6564")

         let hosp2 = Hospitals(category: "Home health care agency", name: "Simon's home care", address: "324 Broadway NYC", website: "SHC.com", inNetworkStatus: "No Aetna", lastSceen: String(), electronicHealthCarePatientPortal: String(), notes: String(), contact1: "Office: 718-565-6564")

        return [hosp1, hosp2]
    }

    static func getMockHospitalResponse() -> [[String:Any]] {
        var dictionaryCollection:[[String:Any]] = []
        let result = mockResultsFromDatabase()
        for item in result {
            try! dictionaryCollection.append(item.toDictionary())
        }
        return dictionaryCollection
    }

}
