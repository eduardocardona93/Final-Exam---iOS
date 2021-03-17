//
//  SelectedViewController.swift
//  FinalExam
//
//  Created by user192101 on 3/17/21.
//  Copyright © 2021 user192101. All rights reserved.
//

import UIKit

class SelectedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        selectedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let course = selectedList[indexPath.row]
        let cell = selectedTable.dequeueReusableCell(withIdentifier: "selectedCell") as! SelectedCourseCell
        cell.setCourse(course: course)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let courseDel = selectedList[indexPath.row]
        countHours -= courseDel.courseHours
        totalFee -= courseDel.courseFee
        totalHoursLbl.text = String(countHours)
        totalFeeLbl.text = "$ " + String(format: "%.2f", totalFee)
        selectedList.remove(at: indexPath.row)
        selectedTable.reloadData()
    }
    
    
    @IBOutlet weak var totalHoursLbl: UILabel!
    @IBOutlet weak var totalFeeLbl: UILabel!
    @IBOutlet weak var selectedTable: UITableView!
    var selectedList = [Course]()
    var countHours : Int = 0
    var totalFee: Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalHoursLbl.text = String(countHours)
        totalFeeLbl.text = "$ " + String(format: "%.2f", totalFee)
        selectedTable.delegate = self
        selectedTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    @IBAction func deleteAllClick(_ sender: Any) {
        countHours = 0
        totalFee = 0.0
        totalHoursLbl.text = String(countHours)
        totalFeeLbl.text = "$ " + String(format: "%.2f", totalFee)
        selectedList = []
        selectedTable.reloadData()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.

        let mainVC = segue.destination as! ViewController
        mainVC.selectedList = selectedList
        mainVC.countHours = countHours
        mainVC.totalFee = totalFee
    }


}
