//
//  AllCocktailsViewController.swift
//  MyCocktail
//
//  Created by Kenny Cardenas Reyes on 8/15/20.
//  Copyright © 2020 Kenny Cardenas Reyes. All rights reserved.
//

import UIKit
import Nuke

class AllCocktailsViewController: UIViewController {
    
    @IBOutlet weak var cocktailTableView: UITableView!
    var connection:Connection?
    var allCocktails:AllCocktail?

    override func viewDidLoad() {
        super.viewDidLoad()
        connection = Connection()
        
        connection?.execute(path: "filter.php?a=Alcoholic", httpMethod: .get, completition: { (AllCocktail) in
            DispatchQueue.main.async {
                self.allCocktails = AllCocktail as? AllCocktail
                self.cocktailTableView.reloadData()
            }
        }, httpRequestParams: nil)
    }


}

extension AllCocktailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let drinks = self.allCocktails?.drinks{
            return 30
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CocktailCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CocktailCell
        
        if let drinks = self.allCocktails?.drinks{
            cell.cocktailName.text = "\(drinks[indexPath.row].strDrink)"
            let options = ImageLoadingOptions(
              placeholder: UIImage(named: "dark-moon"),
              transition: .fadeIn(duration: 0.5)
            )
            let imgReq = ImageRequest(url: URL(string: drinks[indexPath.row].strDrinkThumb ?? "")!, processors: [
                ImageProcessors.Circle()
            ])
            Nuke.loadImage(with: imgReq,options: options, into: cell.imgCocktail)
            

        }
        
        return cell
    }
    
}
