//
//  FirstTimeVC.swift
//  Assignment
//
//  Created by Marcin Tomczuk on 01/12/2018.
//  Copyright © 2018 Marcin Tomczuk. All rights reserved.
//

import UIKit

class FirstTimeVC: UIViewController,UITextFieldDelegate {
    
    
    
    
    
    @IBOutlet weak var wordd: UILabel!
    
    
    
    
    @IBOutlet weak var languageOne: UITextField!
    
    @IBOutlet weak var languageTwo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        languageOne.delegate = self
        languageTwo.delegate = self
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
            
            let alert = UIAlertController(title: "Do you want to save languages?", message: nil, preferredStyle: .alert)
            let subButton = UIAlertAction(title: "Yes", style: .default, handler: self.sub)
            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(subButton)
            alert.addAction(cancelButton)
            self.present(alert, animated: true, completion: nil)
        
        
       
        
        
    }
    
    func sub(alert: UIAlertAction!){
        performSegue(withIdentifier: "goToMain", sender: self)
        ViewController().removeAllData()
        UserDefaults.standard.set(languageOne.text, forKey: "word")
        UserDefaults.standard.set(languageTwo.text, forKey: "meaning")
    }
 

}
