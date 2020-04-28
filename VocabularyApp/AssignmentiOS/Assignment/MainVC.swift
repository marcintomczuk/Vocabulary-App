//
//  MainVC.swift
//  Assignment
//
//  Created by Marcin Tomczuk on 01/12/2018.
//  Copyright © 2018 Marcin Tomczuk. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    
    
    
    
    @IBOutlet weak var language1: UILabel!
    
    @IBOutlet weak var language2: UILabel!
    
    
    override func viewDidLoad() {
        var language1Upper: String
        var language2Upper: String
        super.viewDidLoad()
        
        if let languageOne = UserDefaults.standard.value(forKey: "word"){
           if let languageTwo = UserDefaults.standard.value(forKey: "meaning"){
            language1Upper = "\(languageOne)"
            language2Upper = "\(languageTwo)"
            language1.text = language1Upper.capitalized
            language2.text = language2Upper.capitalized
        }
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func unwindToMenu(unwindSegue: UIStoryboardSegue) {
        }
    
  

}
