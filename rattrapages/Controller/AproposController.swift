//
//  AproposController.swift
//  rattrapages
//
//  Created by Elbar David on 06/10/2022.
//

import UIKit

class AproposController: UIViewController {

    
    @IBOutlet weak var titleAPropos: UILabel!
    
    @IBOutlet weak var profilPicture: UIImageView!
    
    @IBOutlet weak var profilDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profilPicture.layer.cornerRadius = 30
        profilPicture.clipsToBounds = true
        
        profilDescription.numberOfLines = 2;
        
    }
    


}
