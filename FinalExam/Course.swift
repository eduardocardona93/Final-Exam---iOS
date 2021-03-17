//
//  Course.swift
//  FinalExam
//
//  Created by user192101 on 3/17/21.
//  Copyright © 2021 user192101. All rights reserved.
//

import Foundation


class Course {
    var courseName: String
    var courseHours: Int
    var courseFee: Double

    
    init(name:String, hours:Int, fee: Double) {
        self.courseName = name 
        self.courseHours = hours 
        self.courseFee = fee 
    }
    
    
}
