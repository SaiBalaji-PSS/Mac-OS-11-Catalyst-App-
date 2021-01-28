//
//  ViewController.swift
//  ToDoClient
//
//  Created by saibalaji on 27/01/21.
//

import UIKit

class ToDoVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    

    @IBOutlet weak var prioritysegment: UISegmentedControl!
    @IBOutlet weak var todoTV: UITableView!
    @IBOutlet weak var todotxtfield: UITextField!
    
    var todotasks = [Todo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        todoTV.delegate = self
        todoTV.dataSource = self
        
        
        NetworkService.SharedObj.getTodos { (TodoTasks) in
            print(TodoTasks.items.count)
            
            
            self.todotasks = TodoTasks.items
            
            self.todoTV.reloadData()
        }
        
    }


    @IBAction func addbtnClicked(_ sender: Any) {
        
        NetworkService.SharedObj.addToDo(task: Todo(item: todotxtfield.text!, priority: prioritysegment.selectedSegmentIndex)) { (TodoTasksFromServer) in
            
            
            self.todotasks = TodoTasksFromServer.items
            self.todoTV.reloadData()
            
        }
       
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todotasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
      
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomCell
        {
            let task = todotasks[indexPath.row]
            
            cell.updateCell(taskname: task.item, priority: task.priority)
            
            return cell
        }
        
        return UITableViewCell()

    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

