//
//  ViewController.swift
//  task5CoreData
//
//  Created by Noura Khaled on 19/12/2018.
//  Copyright © 2018 Noura Almugarri. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let studentsInfo = studentArray[indexPath.row]
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
                cell.SNameLabel.text = studentsInfo.name
                cell.studentAgeLabel.text = studentsInfo.age
                return cell
    }
    
    
    var studentArray: [Students] = []
    
    
    @IBOutlet weak var studentsTable: UITableView!
    
    func registerTableViewCell(){
        studentsTable.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Students List"
        self.fetchData()
        registerTableViewCell()
        // Do any additional setup after loading the view, typically from a nib.
        
        // This we are doing to make some deferentiation instead of entering name every time
        
        //        let suffix:String = Date().description
        //        let studentName = "Nada - \(suffix)"
        //        let studentAge = "22"
        
        //        self.insertStudentInfo(name: "rawan", age: "11")
        
        
        
        
        
        //        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        //            return
        //        }
        //
        //        let context = appDelegate.persistentContainer.viewContext
        //
        //        //2
        //        let fetchRequest = NSEntityDescription.entity(forEntityName: "Students", in: context)
        //        let newStudent = NSManagedObject(entity: fetchRequest!, insertInto: context)
        //
        //        newStudent.setValue("Noura", forKey: "name")
        //        newStudent.setValue("25", forKey: "age")
        //        //3
        //        do {
        //            try context.save()
        //        } catch {
        //            print("Failed saving") }
        
        
    }
    
    func insertStudentInfo (name: String, age: String) {
        // Reading appDelegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // Getting context
        let context = appDelegate.persistentContainer.viewContext
        
        // Creating Students instance
        let students = Students(context: context)
        students.name = name
        students.age = age
        
        //        students.setValue("Noura", forKey: "name")
        //        students.setValue("11", forKey: "age")
        
        context.insert(students)
        appDelegate.saveContext()
        
    }
    func fetchData (){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        do {
            let records = try context.fetch(Students.fetchRequest()) as! [Students]
            studentArray = records
            studentsTable.reloadData()
            //            let firstStudentRecord:Students = records.first as! Students
            
            //            print("=================")
            //            print("Student name: \(firstStudentRecord.name!)")
            //            print("Student age: \(firstStudentRecord.age!)")
            
            for student in studentArray {
                print(student.name)
                print(student.age)
            }
            
        } catch (let error){
            print("Error occured \(error)")
        }
    }
    
}

