//
//  CompleteToDoViewController.swift
//  ToDo List
//
//  Created by Peter Milligan on 2020/04/07.
//  Copyright © 2020 John Milligan. All rights reserved.
//

import UIKit

class CompleteToDoViewController: UIViewController {
    
    var previousVC = ToDoTableViewController()
    var selectedToDo : ToDoCoreData?

    @IBOutlet weak var titleLabel: UILabel!
    @IBAction func completeTapped(_ sender: Any) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let theToDo = selectedToDo {
                context.delete(theToDo)
                navigationController?.popViewController(animated: true)
            }
        }
//        var index = 0
//        for toDo in previousVC.toDos{
//            if toDo.name == selectedToDo.name {
//                previousVC.toDos.remove(at: index)
//                previousVC.tableView.reloadData()
//                navigationController?.popViewController(animated: true)
//                break
//            }
//            index += 1
//        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let theToDo = selectedToDo {
            titleLabel.text = theToDo.name
        }
        
        // Do any additional setup after loading the view.
    }

}
