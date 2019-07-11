//
//  ViewController.swift
//  swifty words
//
//  Created by admin on 7/9/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var cluesLabel : UILabel!
    var answerLabel : UILabel!
    var currentAnswer : UITextField!
    var scoreLabel : UILabel!
    var letterButtons = [UIButton]()
    
    var activatedButtons = [UIButton]()
    var solutions = [String]()
    var score = 0 {
        didSet{
            scoreLabel.text = "Score: \(score)"
        }
    }
    var level = 1
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadLevel()
        // Do any additional setup after loading the view.
    }
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        // more code here
        scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.textAlignment = .right
        scoreLabel.text = "\(score)"
         view.addSubview(scoreLabel)
        
        cluesLabel = UILabel()
        cluesLabel.translatesAutoresizingMaskIntoConstraints = false
         cluesLabel.text = "CLUES"
        cluesLabel.textAlignment = .left
        cluesLabel.textColor = .black
        cluesLabel.numberOfLines = 0
        cluesLabel.font = UIFont.systemFont(ofSize: 24)
        cluesLabel.font = UIFont.boldSystemFont(ofSize: 30)
       
        view.addSubview(cluesLabel)
        
        
        answerLabel = UILabel()
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.textAlignment = .right
        answerLabel.textColor = .black
        answerLabel.text = "ANSWERS"
        answerLabel.font = UIFont.systemFont(ofSize: 24)
        answerLabel.font = UIFont.boldSystemFont(ofSize: 30)
        
        view.addSubview(answerLabel)
        cluesLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        answerLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        
        
        currentAnswer = UITextField()
        currentAnswer.translatesAutoresizingMaskIntoConstraints = false
        currentAnswer.placeholder = "Tap a letter to answer!"
        currentAnswer.font = UIFont.systemFont(ofSize: 43)
        currentAnswer.textAlignment = .center
        currentAnswer.isUserInteractionEnabled = false
        view.addSubview(currentAnswer)
        
       
        
        
        let SubmitButton = UIButton(type: .system)
        SubmitButton.translatesAutoresizingMaskIntoConstraints = false
        SubmitButton.setTitle("SUBMIT", for: .normal)
        SubmitButton.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
        view.addSubview(SubmitButton)
        
        let ClearButton = UIButton(type: .system)
        ClearButton.translatesAutoresizingMaskIntoConstraints = false
        ClearButton.setTitle("CLEAR", for: .normal)
        ClearButton.addTarget(self, action: #selector(clearButtonPressed), for: .touchUpInside)
    
        view.addSubview(ClearButton)
        
          let ButtonsWiew = UIView()
        ButtonsWiew.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ButtonsWiew)
        
       
       
        
        NSLayoutConstraint.activate([
               scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
               scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            cluesLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            cluesLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            cluesLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6,constant: -100),
            answerLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            answerLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            answerLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor,multiplier: 0.4,constant: 100),
            answerLabel.heightAnchor.constraint(equalTo: cluesLabel.heightAnchor),
            currentAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentAnswer.topAnchor.constraint(equalTo: cluesLabel.bottomAnchor, constant: 60),
            
            SubmitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
             SubmitButton.heightAnchor.constraint(equalToConstant: 44),
            SubmitButton.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor, constant: 30),
            ClearButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            ClearButton.centerYAnchor.constraint(equalTo:SubmitButton.centerYAnchor),
            ClearButton.heightAnchor.constraint(equalToConstant: 44),
            ButtonsWiew.widthAnchor.constraint(equalToConstant: 750),
            ButtonsWiew.heightAnchor.constraint(equalToConstant: 350),
            ButtonsWiew.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ButtonsWiew.topAnchor.constraint(equalTo:SubmitButton.bottomAnchor, constant: 20),
            ButtonsWiew.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -100)
            
            
            ])
        
        let width = 150
        let height = 80
        
        for row in 0..<4 {
            for column in 0..<5{
                let letterButton = UIButton(type: .system)
                letterButton.setTitle("WWW", for: .normal)
                letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
                letterButton.addTarget(self, action: #selector(letterButtonPressed), for: .touchUpInside)
                
                let fram = CGRect(x: column * width, y: row * height, width: width, height: height)
                letterButton.frame = fram
                ButtonsWiew.addSubview(letterButton)
                letterButtons.append(letterButton)
                
            }
        }
        
    }
    
    @objc func letterButtonPressed(_ sender:UIButton){
        guard let buttonTitle = sender.titleLabel?.text else{return}
        currentAnswer.text = currentAnswer.text?.appending(buttonTitle)
        activatedButtons.append(sender)
        sender.isHidden = true
        
    }
    @objc func submitButtonPressed(_ sender:UIButton){
      
        guard let answerText = currentAnswer.text else {
         return
        }
        
        if let solutionPosition = solutions.firstIndex(of: answerText){
            activatedButtons.removeAll()
           
            
            var splitAnswer = answerLabel.text?.components(separatedBy: "\n")
            splitAnswer?[solutionPosition] = answerText
            answerLabel.text = splitAnswer?.joined(separator: "\n")
            currentAnswer.text = ""
            score += 1
            //scoreLabel.text = "\(score += 1)"
          
            if score % 7 == 0 {
                let ac = UIAlertController(title: "Well Done!", message: "Are you ready for the next Level?", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Let's do it again", style: .default, handler: levelUp))
                present(ac,animated: true)
            }
        }
        
    }
    
    func levelUp(action: UIAlertAction){
        level += 1
        solutions.removeAll(keepingCapacity: true)
        
        loadLevel()
        
        for btn in letterButtons{
            btn.isHidden = false
        }
        
        // nex level
    }
    

    @objc func clearButtonPressed(_ sender:UIButton){
        currentAnswer.text = ""
        for btn in activatedButtons{
            btn.isHidden = false
        }
        activatedButtons.removeAll()
    }
    
    
    func loadLevel(){
        var cluesString = ""
        var solutionString = ""
        var letterBits = [String]()
        if let levelFileUrl =  Bundle.main.url(forResource: "level\(level)", withExtension: "txt"){
            if let contentFile = try? String(contentsOf: levelFileUrl){
                var lines = contentFile.components(separatedBy: "\n")
                lines.shuffle()
                for(index,line) in lines.enumerated(){
                    let parts = line.components(separatedBy: ": ")
                    let answer = parts[0]
                    let clue = parts[1]
                     cluesString +=  "\(index + 1 ).\(clue)\n"
                    let solutionWord = answer.replacingOccurrences(of: "|", with: "")
                    solutionString += "\(solutionWord.count) letters\n"
                   
                    solutions.append(solutionWord)
                    
                    let bits = answer.components(separatedBy: "|")
                    letterBits += bits
                    
                }
            }
            
        }
        // config buttons
     
        cluesLabel.text = cluesString.trimmingCharacters(in: .whitespacesAndNewlines)
        answerLabel.text = solutionString.trimmingCharacters(in: .whitespacesAndNewlines)
        letterBits.shuffle()
        
        if letterBits.count == letterButtons.count{
            for i in 0..<letterButtons.count{
                letterButtons[i].setTitle(letterBits[i], for: .normal)
            }
        }
    }
}

