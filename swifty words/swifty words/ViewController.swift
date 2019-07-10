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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        // more code here
        scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.textAlignment = .right
        scoreLabel.text = "Score : 0"
         view.addSubview(scoreLabel)
        
        cluesLabel = UILabel()
        cluesLabel.translatesAutoresizingMaskIntoConstraints = false
         cluesLabel.text = "CLUES"
        cluesLabel.textAlignment = .center
        cluesLabel.textColor = .black
        cluesLabel.numberOfLines = 0
        cluesLabel.font = UIFont.systemFont(ofSize: 24)
        cluesLabel.font = UIFont.boldSystemFont(ofSize: 30)
       
        view.addSubview(cluesLabel)
        
        
        answerLabel = UILabel()
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.textAlignment = .center
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
        view.addSubview(SubmitButton)
        
        let ClearButton = UIButton(type: .system)
        ClearButton.translatesAutoresizingMaskIntoConstraints = false
        ClearButton.setTitle("CLEAR", for: .normal)
    
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
            answerLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -100),
            answerLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor,multiplier: 0.4, constant: -100),
            answerLabel.heightAnchor.constraint(equalTo: cluesLabel.heightAnchor),
            currentAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentAnswer.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 60),
            
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
            ButtonsWiew.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -200)
            
            
            ])
        
        let width = 150
        let height = 80
        
        for row in 0..<4 {
            for column in 0..<5{
                let letterButton = UIButton(type: .system)
                letterButton.setTitle("WWW", for: .normal)
                letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
                
                let fram = CGRect(x: column * width, y: row * height, width: width, height: height)
                letterButton.frame = fram
                ButtonsWiew.addSubview(letterButton)
                letterButtons.append(letterButton)
                
            }
        }
        
    }

}

