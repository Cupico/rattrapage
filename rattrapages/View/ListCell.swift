//
//  ListCell.swift
//  rattrapages
//
//  Created by Elbar David on 07/10/2022.
//

import Foundation
import UIKit
import SwiftUI

class ListCell: UITableViewCell{
    

    @IBOutlet weak var name: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUpView(fruit: Fruit){
        name.text = fruit.name
    }
    
}
