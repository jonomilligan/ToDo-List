//
//  AddToDoViewController.swift
//  ToDo List
//
//  Created by Peter Milligan on 2020/03/31.
//  Copyright © 2020 John Milligan. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    var previousVC = ToDoTableViewController()
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        /*let toDo = ToDo()
         
         if let nameUnwrapped = titleTextField.text {
         toDo.name = nameUnwrapped
         toDo.important = importantSwitch.isOn
         
         previousVC.toDos.append(toDo)
         previousVC.tableView.reloadData()
         
         navigationController?.popViewController(animated: true)
         
         }*/
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            let toDo = ToDoCoreData(entity: ToDoCoreData.entity(), insertInto: context)
            
            if let nameUnwrapped = titleTextField.text {
                toDo.name = nameUnwrapped
                toDo.important = importantSwitch.isOn
            }
            
            try? context.save()
            
            navigationController?.popViewController(animated: true)
        }
        
        
        
        
        
    }
    
}
