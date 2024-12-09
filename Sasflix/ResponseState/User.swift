//
//  User.swift
//  Sasflix
//
//  Created by Evgeniy Kozyrev on 05.11.2024.
//

import Foundation

struct User: Decodable {
    let id: UInt
    let userName: String
    let fullName: String
}
