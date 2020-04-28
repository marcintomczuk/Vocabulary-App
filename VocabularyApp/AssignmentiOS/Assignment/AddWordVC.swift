//
//  AddWordVC.swift
//  Assignment
//
//  Created by Marcin Tomczuk on 01/12/2018.
//  Copyright © 2018 Marcin Tomczuk. All rights reserved.
//

import UIKit

class AddWordVC: UIViewController,UITextFieldDelegate {
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        word.delegate = self
        meaning.delegate = self
        // Do any additional setup after loading the view.
    }
    

    
    @IBOutlet weak var word: UITextField!
    @IBOutlet weak var meaning: UITextField!
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    var myWord: WordsList?
    
    var words: String = ""
    var meanings: String = ""
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == word{
            meaning.becomeFirstResponder()
        }else{
            textField.resignFirstResponder()
        }
        
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let words = word.text{
            if let meanings = meaning.text{
                myWord = WordsList(word: words, meaning: meanings)
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
