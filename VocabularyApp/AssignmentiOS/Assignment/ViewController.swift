//
//  ViewController.swift
//  Assignment
//
//  Created by Marcin Tomczuk on 01/12/2018.
//  Copyright © 2018 Marcin Tomczuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITextFieldDelegate {
    
    
    
    
    
    
    var myList = [WordsList]()



    @IBOutlet weak var tableViewList: UITableView!
    
    
    
    
    
    
    
  
    func removeAllData(){
        myList.removeAll()
        savePosition()
        tableViewList?.reloadData()
    }
    
    var storeName = "notes.json"
    
    
    
    private func loadWords(){
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if fileExistsInDocuments(storeName) {
            loadPosition()
        } else {
            savePosition()
        }
        
        
        loadWords()
        title = "Vocabulary List"
        
      

        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return myList.count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "prototype", for: indexPath) as! Cell
        let wordsInList = myList[indexPath.row]
        
        cell.word.text = wordsInList.word.lowercased()
        cell.meaning.text = wordsInList.meaning.lowercased()
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            myList.remove(at: indexPath.row)
            savePosition()
            tableViewList.reloadData()
        }
    }
    
    @IBAction func unWind(sender: UIStoryboardSegue){
        if let sourceVC = sender.source as? AddWordVC, let myWord = sourceVC.myWord{
            let newIP = IndexPath(row: myList.count, section: 0)
            myList.append(myWord)
            savePosition()
            tableViewList.insertRows(at: [newIP], with: .automatic)
            tableViewList.reloadData()
        }
    }
    
    func loadPosition(){
        // Either load last unit practised, or if starting then remember unit 1
        let settingsURL =  urlToFileInDocuments(storeName)
        if let dataFromFile = try? Data(contentsOf: settingsURL) {
            let decoder = JSONDecoder()
            if let loadedNotes = try? decoder.decode(Array<WordsList>.self, from: dataFromFile) {
                myList = loadedNotes
            }
        }
    }
    
    func savePosition(){
        // Saves where we are in the bible to disk
        let settingsURL =  urlToFileInDocuments(storeName)
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(myList) {
            //Write the data to backing store.
            try? data.write(to: settingsURL, options: .noFileProtection)
        }
    }
    
    func fileExistsInDocuments( _ fileName: String ) -> Bool {
        let fileManager = FileManager.default
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docsDir = dirPaths[0]
        let filepathName = docsDir + "/\(fileName)"
        return fileManager.fileExists(atPath: filepathName)
    }
    
    func urlToFileInDocuments( _ fileName: String ) -> URL {
        let docDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = docDirectory.appendingPathComponent(fileName)
        return fileURL
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { 
        let destinationVC = segue.destination as! TestVC
        destinationVC.randomWord = myList.randomElement()!.word
        destinationVC.myList = myList
        
    }
    
    @IBAction func beginButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "toTestVC2", sender: nil)
    }
}





class Cell:UITableViewCell{
    
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var meaning: UILabel!
    }


