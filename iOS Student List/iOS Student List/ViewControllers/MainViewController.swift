//
//  MainViewController.swift
//  iOS Student List
//
//  Created by Seschwan on 5/21/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Outlets & Properties
    private let studentController = StudentController()
    @IBOutlet weak var sortSegmentControl: UISegmentedControl!
    @IBOutlet weak var filterSegmentControl: UISegmentedControl!
    
    private var studentsTVC: StudentTableViewController! {
        didSet {
            // TODO:
            self.updateDataSource()
        }
    }
    
    
    private var students: [Student] = [] {
        didSet {
            self.updateDataSource()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.studentController.loadFromPersistenceStore { (students, error) in
            if let error = error {
                print("There was an error loading students \(error)")
                return
            }
            DispatchQueue.main.async {
                self.students = students ?? []
            }
            
        }

        
    }
    
    
    //MARK: - IBActions & Methods
    
    @IBAction func sort(_ sender: UISegmentedControl) {
        self.updateDataSource()
        
    }
    
    @IBAction func filter(_ sender: UISegmentedControl) {
        self.updateDataSource()
        
    }
    
    private func updateDataSource() {
        var sortedAndFilteredStudents: [Student]
        
        switch self.filterSegmentControl.selectedSegmentIndex {
        case 1:
            sortedAndFilteredStudents = self.students.filter { $0.course == "iOS" } //({ (student) -> Bool in
                //return student.course == "iOS"})
        case 2:
            sortedAndFilteredStudents = self.students.filter { $0.course == "Web"}
        case 3:
            sortedAndFilteredStudents = self.students.filter { $0.course == "UX" }
        default:
            sortedAndFilteredStudents = self.students
        }
        
        if self.sortSegmentControl.selectedSegmentIndex == 0 {
            sortedAndFilteredStudents = sortedAndFilteredStudents.sorted { $0.firstName < $1.firstName }
        } else {
            sortedAndFilteredStudents = sortedAndFilteredStudents.sorted { $0.lastName < $1.lastName }
        }
        
        self.studentsTVC.students = sortedAndFilteredStudents
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StudentListEmbedSegue" {
            self.studentsTVC = segue.destination as! StudentTableViewController
        }
    }

}
