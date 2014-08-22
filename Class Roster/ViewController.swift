//
//  ViewController.swift
//  Class Roster Part 5
//
//  Created by Kevin Pham on 8/20/14.
//  Copyright (c) 2014 Kevin Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var teachers = [Person]()
    var students = [Person]()
    var classRoster = [[Person]]()
// Load in info from plist
    var teacherInfo = [["firstName" : "John", "lastName" : "Clem"], ["firstName" : "Brad", "lastName" : "Johnson"]]
    var studentInfo = [["firstName" : "Jake", "lastName" : "Foster"], ["firstName" : "Christina", "lastName" : "Nghiem"], ["firstName" : "Bamboo", "lastName" : "Nguyen"], ["firstName" : "Khanh", "lastName" : "Nguyen"], ["firstName" : "Nathan", "lastName" : "Peterson"], ["firstName" : "Kevin", "lastName" : "Pham"], ["firstName" : "Marc", "lastName" : "Thomas"]]
    var defaultProfileImage = UIImage(named: "default")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.teacherArray(teacherInfo)
        self.studentArray(studentInfo)
    }
    
    override func viewWillAppear(animated: Bool) {
        // super.viewWillAppear(true)
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func teacherArray(teacherArray: NSArray) {
        for teacher in teacherArray {
            var newPerson = Person(firstName: teacher["firstName"] as String, lastName: teacher["lastName"] as String)
            teachers.append(newPerson)
        }
        classRoster.append(teachers)
    }
    
    func studentArray(studentArray: NSArray) {
        for student in studentArray {
            var newPerson = Person(firstName: student["firstName"] as String, lastName: student["lastName"] as String)
            students.append(newPerson)
        }
        classRoster.append(students)
    }

    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return self.classRoster.count
    }
    
    // ** Update this to retrive Header names from array. **
    func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String! {
        switch section {
        case 0:
            return "Teachers"
        default:
            return "Students"
        }
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.classRoster[section].count
    }

    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        var personForRow = self.classRoster[indexPath.section][indexPath.row]
        cell.textLabel.text = personForRow.fullName()

        // ** Adjust imageView frame and size OR should I pop a UIImageView controller inside prototype cell. **
        // cell.imageView.frame = CGRectMake(0, 0, 32, 32)
        // cell.imageView.bounds = CGRectMake(0, 0, 32, 32)
        if personForRow.profileImage != nil {
            cell.imageView.image = personForRow.profileImage
        } else {
            cell.imageView.image = defaultProfileImage
        }
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier == "showDetail" {
            var detailViewController = segue.destinationViewController as DetailViewController
            let section = tableView.indexPathForSelectedRow().section
            let row = tableView.indexPathForSelectedRow().row
            
            var personForRow : Person
            switch tableView.indexPathForSelectedRow().section {
            case 0:
                personForRow = teachers[row]
            default:
                personForRow = students[row]
            }
            
            detailViewController.selectedPerson = personForRow
        }

    }
    
    @IBAction func cancelButton(segue: UIStoryboardSegue) {
    }

}

