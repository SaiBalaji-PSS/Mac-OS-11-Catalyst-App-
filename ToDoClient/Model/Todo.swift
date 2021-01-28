//
//  Todo.swift
//  ToDoClient
//
//  Created by saibalaji on 27/01/21.
//

import Foundation


struct TodoS: Codable
{
    let items: Array<Todo>
}


struct Todo: Codable
{
    let item: String
    let priority: Int
}
