//
//  RandomViewController.swift
//  MyCocktail
//
//  Created by Kenny Cardenas Reyes on 8/16/20.
//  Copyright © 2020 Kenny Cardenas Reyes. All rights reserved.
//

import UIKit

class RandomViewController: UIViewController {
    
    
    @IBOutlet weak var btn_random: UIButton!
    var connection:Connection?
    var detail:DetailCocktail?

    override func viewDidLoad() {
        super.viewDidLoad()
        btn_random.roundButtom()
    }
    
    @IBAction func randomTouchUpInside(_ sender: Any) {
        connection = Connection()

        connection?.executeRandom(path: "random.php", httpMethod: .get, completition: { (DetailCocktail) in
            DispatchQueue.main.async {
                self.detail = DetailCocktail as? DetailCocktail
                self.performSegue(withIdentifier: "randomDetail", sender: self)
            }
        }, httpRequestParams: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "randomDetail"{
            let destination = segue.destination as! DetailViewController
            destination.detailDrinks = self.detail
        }
    }

}
