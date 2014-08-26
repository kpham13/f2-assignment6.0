//
//  Person.swift
//  Class Roster Part 5
//
//  Created by Kevin Pham on 8/20/14.
//  Copyright (c) 2014 Kevin Pham. All rights reserved.
//

import UIKit

class Person: NSObject, NSCoding {
    
    var firstName : String
    var lastName : String
    
    var profileImage : UIImage?
    
    init (firstName : String, lastName : String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func fullName() -> String {
        return firstName + " " + lastName
    }
    
    // ** NSKeyedArchiver **
    required init(coder aDecoder: NSCoder!) {
        self.firstName  = aDecoder.decodeObjectForKey("firstName") as String
        self.lastName   = aDecoder.decodeObjectForKey("lastName") as String
        // profileImage
        // self.profileImage = aDecoder.decodeObjectForKey("profileImage") as UIImage?
    }
    
    // ** NSKeyedArchiver **
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encodeObject(firstName, forKey: "firstName")
        aCoder.encodeObject(lastName, forKey: "lastName")
        // profileImage archive
        // aCoder.encodeObject(profileImage, forKey: "profileImage")
    }
    
}