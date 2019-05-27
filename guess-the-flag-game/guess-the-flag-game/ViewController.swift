//
//  ViewController.swift
//  guess-the-flag-game
//
//  Created by mac on 5/26/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    override func viewDidLoad() {
        super.viewDidLoad()
         countries += ["spain","russia","us","uk", "estonia", "nigeria","france","germany", "poland","italy","monaco",""]
        askQuestion()
        // Do any additional setup after loading the view, typically from a nib.
    }
  
    func askQuestion(action: UIAlertAction! = nil){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
       
        button1.setImage(UIImage(named: countries[0]), for: .normal)
         button2.setImage(UIImage(named: countries[1]), for: .normal)
         button3.setImage(UIImage(named: countries[2]), for: .normal)
        button1.layer.borderWidth = 1
         button2.layer.borderWidth = 1
         button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        title = countries[correctAnswer].uppercased()
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title:String
        if sender.tag == correctAnswer{
            title = "corrrect👋"
            score += 1
        }else{
            title = "wrong!🛑"
            score -= 1
        }
        
    var ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Continue", style: .default, handler: askQuestion)
        ac.addAction(action)
        present(ac, animated: true)
    }
    
}

