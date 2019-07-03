//
//  MockData.swift
//  swiftToHtmlPoc
//
//  Created by Quagnitia on 6/9/19.
//  Copyright © 2019 Quagnitia. All rights reserved.
//

import Foundation

struct MockData
{
    func getMockDataForReports() -> [String: Any]{
        return [ //"doctor": Doctor.getMockDoctorResponse(),
                 //"hospital": Hospitals.getMockHospitalResponse(),
               //  "username":"Batman",
                // "pharmacy": getMockDataForPharmacy(),
            "personalProfile": UserProfile.getMockUserProfileResponse(),
                 //"petDetails": getMockDataForPets(),
                // "allergy": getMockDataForAllergy()
        ]
    }

    func getMockDataForPharmacy()->[[String:String]]{
        return [[
            "name": "Cvs Uws Ny",
            "address": "200 West End Ave 70th St United States",
            "website": "",
            "notes": "",
            "Contact1": "Office:(212) 496-4198"
            ], [
                "name": "Walmart NY",
                "address": "200 West End Ave 70th St United States",
                "website": "",
                "notes": "",
                "Contact1": "Office:(210) 496-4198"
            ]];
    }
    
    func getMockDataForPets()->[[String:String]]{
        return [["name": "Lucy",
                 "breed": "Lab",
                 "color": "White",
                 "microchipNumber": "123456",
                 "vetName": "City vet",
                 "vetAddress": "West 72nd",
                 "vetPhone": "212732700",
                 "namePetCare": "Stacey",
                 "addressPetCare": "7nd S",
                 "carePhone": "123456789",
                 "birthday": "10-Dec-2009",
                 "note": "Not good with small children"]]
    }

    func getMockDataForAllergy()->[[String:String]]{
        return [[
            "Allergy1": "Naxoplaxon",
            "Reaction": "Difficulty breathing",
            "Treatment": "Call Dr."
            ], [
                "Allergy2": "Egg plant",
                "Reaction": "Hives",
                "Treatment": "Benedryl"
            ]]
    }
}

