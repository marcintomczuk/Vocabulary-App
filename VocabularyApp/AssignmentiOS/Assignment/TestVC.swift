//
//  TestVC.swift
//  Assignment
//
//  Created by Marcin Tomczuk on 02/12/2018.
//  Copyright © 2018 Marcin Tomczuk. All rights reserved.
//

import UIKit

class TestVC: UIViewController, UITextFieldDelegate {

    var randomWord:String = ""
    var myList = [WordsList]()
   
    
    @IBOutlet weak var wordLabel: UILabel!
    
    @IBOutlet weak var meaningLabel: UILabel!
    
    @IBOutlet weak var checkAnswer: UILabel!
    
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var questionsLabel: UILabel!
    
    @IBOutlet weak var finalResult: UILabel!
    
    
    @IBOutlet weak var input: UITextField!
    
    
    @IBOutlet weak var questionsCount: UILabel!
    
    
    @IBOutlet weak var coments: UILabel!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var buttonBack: UIButton!
    
    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "backToMenu", sender: self)
    }
    
    var myScore = 0
    var countQuestions = 0
    var noOfQuestion = 1
    @IBAction func savePressed(_ sender: Any) {
        countQuestions += 1
        noOfQuestion += 1
        questionsLabel.text = " Question \(noOfQuestion) of 6"
        questionsCount.text = "\(countQuestions)"
        
        if questionsCount.text == "6"{
            finalResult.text = "You got \(myScore) out of 6 points!"
            saveButton.isHidden = true
            checkAnswer.isHidden = true
            wordLabel.isHidden = true
            questionsLabel.isHidden = true
            input.isHidden = true
            score.isHidden = true
            buttonBack.isHidden = false
            coments.isHidden = false
            finalResult.isHidden = false
        }
        if myScore == 0 || myScore == 1 || myScore == 2{
            coments.text = "You should study more"
        }
        if myScore == 3 || myScore == 4 {
            coments.text = "Good score !"
        }
        if myScore == 5 || myScore == 6 {
            coments.text = "Great score, Congratulation!"
        }
        if input.text == meaningLabel.text{
            checkAnswer.textColor = UIColor.green
            checkAnswer.text = "correct!"
            myScore += 1
            input.text = nil
            score.text = "My Score: \(myScore)"
            drawNewQuestion()
            }else{
            checkAnswer.textColor = UIColor.red
            checkAnswer.text = "wrong"
            drawNewQuestion()
            input.text = nil
        }
        
    }
   
    
    func drawNewQuestion(){
        let random = myList.randomElement()
        let word = random?.word
        let mean = random?.meaning
        
        meaningLabel.text = mean
        wordLabel.text = word
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        input.delegate = self
   
        score.text = "My Score: 0"
        
   drawNewQuestion()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    }
