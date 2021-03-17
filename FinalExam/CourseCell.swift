//
//  CourseCell.swift
//  FinalExam
//
//  Created by user192101 on 3/17/21.
//  Copyright © 2021 user192101. All rights reserved.
//

import UIKit

class CourseCell: UITableViewCell {

    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var courseHoursLabel: UILabel!
    @IBOutlet weak var courseCostLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCourse( course: Course){
        courseNameLabel.text = course.courseName
        courseHoursLabel.text = String(course.courseHours)
        courseCostLabel.text = String(format: "%.2f", course.courseFee)
    }

}
