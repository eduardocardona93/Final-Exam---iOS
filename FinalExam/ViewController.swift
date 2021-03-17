//
//  ViewController.swift
//  FinalExam
//
//  Created by user192101 on 3/17/21.
//  Copyright © 2021 user192101. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var courseList = [Course]()
    var selectedList = [Course]()
    var selCourseIndex : Int = -1
    var countHours : Int = 0
    var totalFee: Double = 0.0
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        courseList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let course = courseList[indexPath.row]
        
        let cell = courseTable.dequeueReusableCell(withIdentifier: "courseCell") as! CourseCell
        cell.setCourse(course: course)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selCourseIndex = indexPath.row
    }
    

    @IBAction func addCourse(_ sender: Any) {
        successLbl.text = ""
        if selCourseIndex > -1 {
            
            let course = courseList[selCourseIndex]
            if searchCourseAlreadySelected(course: course){
                errorLbl.text = "Course Already Selected!"
            }else if  countHours + course.courseHours > 19{
                errorLbl.text = "This Course exceeds Hour limit (19)"
            }else{
                errorLbl.text = ""
                successLbl.text = "Course Added Successfully"
                countHours += course.courseHours
                totalFee += course.courseFee
                selectedList.append(course)
                
            }
            
        }else{
            errorLbl.text = "Select a Course"
        }
        
    }
    @IBOutlet weak var successLbl: UILabel!
    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var courseTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        fillData()
        successLbl.text = ""
        errorLbl.text = ""
        courseTable.delegate = self
        courseTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func searchCourseAlreadySelected (course: Course) -> Bool{
        for selectedCourse in selectedList{
            if course.courseName == selectedCourse.courseName{
                return true
            }
        }
        
        return false
        
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.

        let selectedVC = segue.destination as! SelectedViewController

        selectedVC.selectedList = selectedList
        selectedVC.countHours = countHours
        selectedVC.totalFee = totalFee
    }

    func fillData(){
        courseList.append(Course(name:"Java", hours: 5, fee: 1600))
        courseList.append(Course(name:"Python", hours: 4, fee: 1850))
        courseList.append(Course(name:"Database", hours: 3, fee: 1300))
        courseList.append(Course(name:"Web development", hours: 4, fee: 1200))
        courseList.append(Course(name:"iOS development", hours: 5, fee: 2200))
        courseList.append(Course(name:"Android development", hours: 5, fee: 2000))
        courseList.append(Course(name:"System analysis", hours: 4, fee: 1900))
        courseList.append(Course(name:"Cloud computing", hours: 3, fee: 1250))
        courseList.append(Course(name:"Machine learning", hours: 5, fee: 2300))
        courseList.append(Course(name:"Problem-solving", hours: 3, fee: 950))
    }

}
