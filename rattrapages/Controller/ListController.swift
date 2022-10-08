//
//  ListController.swift
//  rattrapages
//
//  Created by Elbar David on 07/10/2022.


import UIKit
import SwiftUI


class ListController: UIViewController {
    
    var fruits = [Fruit]()
    
    var fruitNameText: UITextField?
    
    var visibleFruit = 5
    

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addFruit: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
   
        displayFruits()
      
    }
    

    @IBAction func clickAddFruit(_ sender: UIButton) {
        visibleFruit += 1
        self.tableView.reloadData()
        print(visibleFruit)
    }


    
    func displayFruits() {
        
        guard let url = URL(string: "https://www.fruityvice.com/api/fruit/all") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                if let decodedPosts = try? JSONDecoder().decode([Fruit].self, from: data) {
                    self.fruits = decodedPosts
                    //t
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.tableView.isHidden = false
                    }
                } else {
                   debugPrint("Failure to decode posts.")
               }
            } else {
                debugPrint("Failure to get data.")
            }
        }.resume()
        
    }

    
}


extension ListController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count > visibleFruit ? visibleFruit : fruits.count
      

    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as? ListCell else { return UITableViewCell()}
        cell.setUpView(fruit: fruits[indexPath.row])
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        print("Deleted")

        visibleFruit -= 1
        self.fruits.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        //self.tableView.reloadData()
      }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fruitSelected = fruits[indexPath.row].name
        let alert = UIAlertController(title: "Editer", message: "Editer le nom du fruit", preferredStyle: .alert)
        let update = UIAlertAction(title: "Mise à jour", style: .default){
            (action) in
            let updatedName = self.fruitNameText?.text!
            self.fruits[indexPath.row].name = updatedName!
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        let cancel = UIAlertAction(title: "Quitter", style: .cancel){
            action in print("cancel")
        }
        alert.addAction(update)
        alert.addAction(cancel)
        alert.addTextField{(textfield) in
            self.fruitNameText = textfield
            self.fruitNameText?.placeholder = "Editer le nom"
            self.fruitNameText?.text = fruitSelected
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
 }

}






