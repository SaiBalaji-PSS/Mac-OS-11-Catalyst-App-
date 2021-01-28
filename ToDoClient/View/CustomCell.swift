//
//  CustomCell.swift
//  ToDoClient
//
//  Created by saibalaji on 27/01/21.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var priorityView: UIView!
    @IBOutlet weak var taskname: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCell(taskname: String,priority: Int)
    {
        self.taskname.text = taskname
        
        switch priority {
        case 0:
            priorityView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            break
            
        case 1:
            priorityView.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            break
            
        
        default:
            priorityView.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        }
    }

    

}
