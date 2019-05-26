//
//  ViewController.swift
//  imagesViewer
//
//  Created by mac on 5/24/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
   
    var pictures = [String]()
   
   

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        loadFiles()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func loadFiles(){
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath:path)
        for item in items{
            if item.hasPrefix("nssl"){
                pictures.append(item)
                print(pictures)
            }
             print("pictures")
           
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Details") as? DetailsViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.imagesCount = pictures.count
            vc.imageIndex = 1
           // let detailViewContoller = DetailsViewController()
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
        
        
    }
}

