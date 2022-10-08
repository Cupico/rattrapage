//
//  ViewController.swift
//  rattrapages
//
//  Created by Elbar David on 06/10/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var homeLabel: UILabel!
    
    @IBOutlet weak var homeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTapped(_ sender: UIButton){
        

        homeLabel.textColor = UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )

    
    }


}

