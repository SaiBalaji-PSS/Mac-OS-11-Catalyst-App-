//
//  NetworkService.swift
//  ToDoClient
//
//  Created by saibalaji on 27/01/21.
//

import Foundation

class NetworkService
{
    static let SharedObj = NetworkService()
    
    let URL_BASE = "http://localhost:3003"
    
    let ADD_TODO_ENDPOINT = "/add"
    
    let session = URLSession(configuration: .default)
    
    
    func getTodos(onSuccess: @escaping(TodoS) -> Void)
    {
        let url = URL(string: "\(URL_BASE)")!
        
        let datatask = session.dataTask(with: url) { (data, response, errors) in
            
            
            DispatchQueue.main.async {
                
                
                if let err = errors
                {
                    print(err.localizedDescription)
                    return
                }
                
                guard let serverdata = data else { print("No data")
                    return
                    
                }
                
                do
                {
                    let item = try JSONDecoder().decode(TodoS.self, from: serverdata)
                    
                    onSuccess(item)
                    
                    
                }
                
                catch
                {
                    print(error.localizedDescription)
                }
                
                
                
                
            }
            
            
      
            
            
        }
        
        datatask.resume()
        

        
    }
    
    func addToDo(task: Todo,onSucess: @escaping(TodoS) -> Void)
    {
        let url = URL(string: "\(URL_BASE)\(ADD_TODO_ENDPOINT)")
        var request = URLRequest(url: url!)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do
        {
            let body = try JSONEncoder().encode(task)
            request.httpBody = body
            
            
            let task = session.dataTask(with: request) { (data, response, error) in
                
                DispatchQueue.main.async {
                    
                
                
                if let err = error
                {
                    print("ERROR 1\(err.localizedDescription)")
                    return
                }
                
                guard let dt = data else {return }
                
                
                
                do
                {
                    let tasks = try JSONDecoder().decode(TodoS.self, from: dt)
                    
                    onSucess(tasks)
                }
                
                catch
                {
                    print("ERROR 2\(error.localizedDescription)")
                }
                
                
                
            }
            }
            
            task.resume()
            
        }
        
        catch
        {
            print(error.localizedDescription)
        }
        
       
        
        
    }
}
