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
        return [ "doctor": Doctor.getMockDoctorResponse(),
                 "hospital": Hospitals.getMockHospitalResponse(),
                // "username":"codecat15",
                // "pharmacy": getMockDataForPharmacy(),
            "personalProfile": UserProfile.getMockUserProfileResponse(),
                // "pet": getMockDataForPets(),
                // "allergy": getMockDataForAllergy()
        ]
    }

    func getMockDataForPharmacy()->[[String:String]]{
        return [[
            "Name": "Cvs Uws Ny",
            "Address": "200 West End Ave 70th St United States",
            "Website": "",
            "Notes": "",
            "Contact1": "Office:(212) 496-4198"
            ], [
                "Name": "Walmart NY",
                "Address": "200 West End Ave 70th St United States",
                "Website": "",
                "Notes": "",
                "Contact1": "Office:(210) 496-4198"
            ]];
    }
    
    func getMockDataForPets()->[[String:String]]{
        return [["Name": "Lucy",
                 "Breed": "Lab",
                 "Color": "White",
                 "Microchip number": "123456",
                 "Veterinarian Name": "City vet",
                 "Veterinarian Address": "West 72nd",
                 "Veterinarian phone": "212732700",
                 "Name who will care for pet": "Stacey",
                 "Address who will care for pet": "7nd S",
                 "Phone who will care for pet": "123456789",
                 "Birthday": "10-Dec-2009",
                 "Notes about Pet": "Not good with small children"]]
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

