//
//  SelectedCourseCell.swift
//  FinalExam
//
//  Created by user192101 on 3/17/21.
//  Copyright © 2021 user192101. All rights reserved.
//

import UIKit

class SelectedCourseCell: UITableViewCell {

    @IBOutlet weak var selCoourseNameLbl: UILabel!
    @IBOutlet weak var selCourseHoursLbl: UILabel!
    @IBOutlet weak var selCourseCostLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCourse( course: Course){
        selCoourseNameLbl.text = course.courseName
        selCourseHoursLbl.text = String(course.courseHours)
        selCourseCostLbl.text = String(format: "%.2f", course.courseFee)
    }
}
