//
//  User.swift
//  Kitkite-iOS
//
//  Created by Kefi Amine on 22/11/2022.
//

import Foundation

struct User {
    
    init(_id: String? = nil, username: String? = nil, email: String? = nil, password: String? = nil, firstname: String? = nil, lastname: String? = nil, birthdate: Date? = nil, imageFilename: String? = nil, bio: String? = nil, isVerified: Bool? = nil) {
        self._id = _id
        self.username = username
        self.email = email
        self.password = password
        self.firstname = firstname
        self.lastname = lastname
        self.birthdate = birthdate
        self.imageFilename = imageFilename
//        self.gender = gender
        self.bio = bio
        self.isVerified = isVerified
    }
    
    init(username: String? = nil, email: String? = nil, password: String? = nil, firstname: String? = nil, lastname: String? = nil, birthdate: Date? = nil) {
        self.username = username
        self.email = email
        self.password = password
        self.firstname = firstname
        self.lastname = lastname
        self.birthdate = birthdate
//        self.gender = gender

    }
    
    
    
    var _id : String?
    var username : String?
    var email : String?
    var password  : String?
    var firstname : String?
    var lastname : String?
    var birthdate : Date?
    var imageFilename : String?
//    var gender : String?
    var bio : String?
    var isVerified : Bool?
    
//    static let `default` = User(_id: "001", username: "boch", email: "test@gmail.com", password: "test", firstname: "motez", lastname: "bouchhioua", birthdate: Date.now, imageFilename: "imageFilename", gender: true, bio: "bio", isVerified: true)
//
}
// relations
//    var blockedUsers : [String]?

