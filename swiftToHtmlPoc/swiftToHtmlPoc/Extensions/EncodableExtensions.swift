//
//  EncodableExtensions.swift
//  swiftToHtmlPoc
//
//  Created by Quagnitia on 6/12/19.
//  Copyright © 2019 Quagnitia. All rights reserved.
//

import Foundation

extension Encodable {
    func toDictionary() throws -> [String: Any] {
        let encodedData = try JSONEncoder().encode(self)
        guard let dataDictionary = try JSONSerialization.jsonObject(with: encodedData, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dataDictionary
    }
}
