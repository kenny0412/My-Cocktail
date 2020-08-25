//
//  Connection.swift
//  MyCocktail
//
//  Created by Kenny Cardenas Reyes on 8/15/20.
//  Copyright © 2020 Kenny Cardenas Reyes. All rights reserved.
//

import UIKit
import Foundation

enum httpCode: CustomStringConvertible {
    case get
    case put
    case delete
    case post
    
    var description: String{
        switch self {
        case .get:
            return "GET"
        case .put:
            return "PUT"
        case .delete:
            return "DELETE"
        case .post:
            return "POST"
        default:
            return "GET"
        }
    }
}

typealias Result = ([[String:Any]]) -> Void

typealias ResultAllcocktails = (Any) -> Void


class Connection: NSObject {
    
    var session: URLSession?
    var request: URLRequest?
    
    override init() {
        session = URLSession.shared
    }
    
    let headers = [
        "content-type": "application/json",
        "x-rapidapi-host": "the-cocktail-db.p.rapidapi.com",
        "x-rapidapi-key": "e80c7dd380msh530225b10df1a15p13282ejsnaddfe051cf95"
    ]
    
    func execute(path:String, httpMethod:httpCode, completition:@escaping ResultAllcocktails, httpRequestParams:[String:String]? = nil){
        request = URLRequest(url: URL(string:"https://the-cocktail-db.p.rapidapi.com/" + path)!)
        request?.httpMethod = httpMethod.description
        request?.allHTTPHeaderFields = headers
        
        if let params = httpRequestParams {
            for param in params{
                request?.setValue(param.value, forHTTPHeaderField: param.key)
            }
        }
        
        session?.dataTask(with: request!){ (data,response,error) in
            do{
                let jsonData = try? JSONDecoder().decode(AllCocktail.self, from: data!)

                DispatchQueue.main.async {
                    completition(jsonData!)
                }
            }catch let error{
                print(error.localizedDescription)
            }
            
        }.resume()
        
    }
    
    func executeRandom(path:String, httpMethod:httpCode, completition:@escaping ResultAllcocktails, httpRequestParams:[String:String]? = nil){
        request = URLRequest(url: URL(string:"https://the-cocktail-db.p.rapidapi.com/" + path)!)
        request?.httpMethod = httpMethod.description
        request?.allHTTPHeaderFields = headers
        
        if let params = httpRequestParams {
            for param in params{
                request?.setValue(param.value, forHTTPHeaderField: param.key)
            }
        }
        
        session?.dataTask(with: request!){ (data,response,error) in
            do{
                let jsonData = try? JSONDecoder().decode(DetailCocktail.self, from: data!)

                DispatchQueue.main.async {
                    completition(jsonData!)
                }
            }catch let error{
                print(error.localizedDescription)
            }
            
        }.resume()
        
    }
    
    
}
