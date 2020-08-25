//
//  DescriptionViewController.swift
//  MyCocktail
//
//  Created by Kenny Cardenas Reyes on 8/21/20.
//  Copyright © 2020 Kenny Cardenas Reyes. All rights reserved.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imgTitle: UIImageView!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblInstruction: UILabel!
    @IBOutlet weak var tableIngretients: UITableView!
    var detailDrinks: DetailCocktail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if detailDrinks != nil {
        let options = ImageLoadingOptions(
                     placeholder: UIImage(named: "dark-moon"),
                     transition: .fadeIn(duration: 0.5)
                   )
        let imgReq = ImageRequest(url: URL(string: ((detailDrinks?.drinks[0]["strDrinkThumb"]) ?? "") ?? "")!, processors: [
                       ImageProcessors.Circle()
                   ])
        Nuke.loadImage(with: imgReq,options: options, into: imgTitle)
        self.lblType.text = detailDrinks?.drinks[0]["strAlcoholic"] as? String
        self.lblInstruction.text = detailDrinks?.drinks[0]["strInstructions"] as? String
        self.lblTitle.text = detailDrinks?.drinks[0]["strDrink"] as? String
        }
    }
    
}


//extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let ingredients = self.allCocktails?.drinks{
//            return 30
//        }
//        return 0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell:CocktailCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CocktailCell
//
//        if let drinks = self.allCocktails?.drinks{
//            cell.cocktailName.text = "\(drinks[indexPath.row].strDrink)"
//            let options = ImageLoadingOptions(
//              placeholder: UIImage(named: "dark-moon"),
//              transition: .fadeIn(duration: 0.5)
//            )
//            let imgReq = ImageRequest(url: URL(string: drinks[indexPath.row].strDrinkThumb ?? "")!, processors: [
//                ImageProcessors.Circle()
//            ])
//            Nuke.loadImage(with: imgReq,options: options, into: cell.imgCocktail)
//
//
//        }
//
//        return cell
//    }
//
//}
