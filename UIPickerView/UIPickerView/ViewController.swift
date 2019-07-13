//
//  ViewController.swift
//  UIPickerView
//
//  Created by admin on 7/13/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var favoriteTextField: UITextField!
    @IBOutlet weak var labelView: UILabel!
   
    
     let days=[
      "Monday",
      "Tuesday",
      "Wedensday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ]
    let mounths = [
      "01",
      "02",
      "03",
      "04",
      "05",
      "06"
    ]
    let years = [
        "2001",
        "2010",
        "2011",
        "2012",
        "2013",
        "2015",
        "2016",
        "2017"
    ]
    var fullDate  = ["day":"Wensday","mounth":"01","year":"2019"] {
        didSet{
            favoriteTextField.text = "I don't know"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPicker()
        
        // Do any additional setup after loading the view.
        
    }
    
    func loadPicker(){
        let pickerView = UIPickerView()
         pickerView.delegate = self
        pickerView.backgroundColor = .black
        favoriteTextField.inputView = pickerView
        favoriteTextField.isUserInteractionEnabled = true
        favoriteTextField.allowsEditingTextAttributes  = false
        favoriteTextField.text = ""
        createToolbar()
    }
    func createToolbar(){
       let toolBar = UIToolbar()
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        // customization
        toolBar.barTintColor = .black
        toolBar.tintColor = .white
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dissmissKeyboard))
        toolBar.setItems([doneButton], animated: false)
        favoriteTextField.inputAccessoryView = toolBar
    }

   @objc func dissmissKeyboard(){
        view.endEditing(true)
        
    }

}


extension ViewController: UIPickerViewDelegate,UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
     
        if(component == 0){
            return days.count
        }else if(component == 1){
         
            return mounths.count
        }
        else if(component == 2){
            
            return years.count
        }
        return 0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(component == 0){
            return days[row]
        }else if(component == 1){
            return mounths[row]
        }
        else if(component == 2){
            return years[row]
        }
        return nil
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if(component == 0){
           favoriteTextField.text = days[row]
           // fullDate.append("\(days[row]),")
 
            
        }else if(component == 1){
           
             favoriteTextField.text = mounths[row]
         
                // fullDate.append("\(mounths[row]),")
        }
        else if(component == 2){
           
             favoriteTextField.text = years[row]
           
             //fullDate.append("\(years[row]),")
            
        }
       
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label : UILabel!
        if let view = view as? UILabel{
            label = view
        }else{
            label = UILabel()
        }
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Menlo-Regular", size: 17)
        if(component == 0){
            label.text =  days[row]
        }else if(component == 1){
            label.text =  mounths[row]
        }
        else if(component == 2){
            label.text = years[row]
        }
        
       
        
        return label
        
    }
    
    
}
