//
//  User.swift
//  TestForSmallPDF
//
//  Created by Danijel Vasov on 4/28/21.
//  Copyright © 2021 Danijel Vasov. All rights reserved.
//

import Foundation

struct User: Codable {
    let name: UserName?
    let dob: UserAge?
    let picture: UserPicture?
    let email: String?
    let nat: String?
}


//Helper structs for json decomposition ---*
struct UserName: Codable {
    let first: String?
    let last: String?
}

struct UserAge: Codable {
    let age: Int?
}

struct UserPicture: Codable {
    let large: String?
    let medium: String?
    let thumbnail: String?
}

struct JSONResults: Codable {
    let results: [User]
}
// ---*
