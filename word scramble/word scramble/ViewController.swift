//
//  ViewController.swift
//  word scramble
//
//  Created by mac on 6/3/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var allWords = [String]()
    var usedWords = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptAnswer))
        
        if let wordsFileUrl = Bundle.main.url(forResource: "start", withExtension: "txt"){
            if let startWords = try? String(contentsOf: wordsFileUrl){
                allWords = startWords.components(separatedBy: "\n")
            }
        }
            if allWords.isEmpty {
                allWords = ["silkworm"]
            }
        startGame()
            
        }
   
    
    func startGame (){
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "word", for: indexPath)
        
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
    
    @objc func promptAnswer(){
        let ac  = UIAlertController(title: "Enter Answer", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let sumbitAction = UIAlertAction(title: "Submit", style: .default){
            [weak self, weak ac] _ in
            
            guard let answer = ac?.textFields?[0].text else {return}
            self?.sumbit(answer)
        }
        ac.addAction(sumbitAction)
        present(ac, animated: true)
        
        
    }
   
    
    func sumbit(_ answer:String){
      
        let lowerAnswer = answer.lowercased()
        
        let titleMessage:String
        let errorMessage:String
        if isPossible(word: lowerAnswer){
            if isOriginal(word: lowerAnswer){
                if isReal(word: lowerAnswer){
                    usedWords.insert(lowerAnswer, at: 0)
                    let indexPath = IndexPath(row:0, section:0)
                      tableView.insertRows(at: [indexPath], with: .automatic)
                    return
                }else{
                    titleMessage = "The word is not recognized!"
                    errorMessage = "The word not recogniezed"
                }
            }else{
                titleMessage = "The word is not found!"
                errorMessage = "The word not found"
            }
        }else{
            titleMessage = "The word is not possible!"
            errorMessage = "The word not possible"
        }
        
        let ac = UIAlertController(title: titleMessage, message: errorMessage, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
        
        present(ac,animated: true)
    
    }
    
    func isPossible(word:String)->Bool{
        guard var tempword = title?.lowercased() else {return false}
       
        for letter in word{
            if let position = tempword.firstIndex(of: letter){
                tempword.remove(at: position)
            }else{
                return false
            }
        }
        return true
    }
     func isOriginal(word:String)->Bool{
        return !usedWords.contains(word)
    }
     func isReal(word:String)->Bool{
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledWord = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledWord.location == NSNotFound
    }
}

