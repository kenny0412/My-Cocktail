//
//  AllCocktails.swift
//  MyCocktail
//
//  Created by Kenny Cardenas Reyes on 8/14/20.
//  Copyright © 2020 Kenny Cardenas Reyes. All rights reserved.
//

import Foundation

struct AllCocktail:Codable {
    var drinks: [Drink]
}


struct Drink:Codable {
    var strDrink: String
    var strDrinkThumb: String?
    var idDrink: String
}
