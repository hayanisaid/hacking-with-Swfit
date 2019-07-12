//
//  ViewController.swift
//  white house petitions
//
//  Created by admin on 7/7/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pettions = [Petition]()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        performSelector(inBackground: #selector(loadJsonData), with: nil)
        
        
    }
    
   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return pettions.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        let petition   = pettions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = pettions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

    
    @objc func loadJsonData(){
        let urlString: String
        if navigationController?.tabBarItem.tag == 0 {
            // urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            // urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
      
        
            if let url = URL(string: urlString){
                if let data = try? Data(contentsOf: url){
                    // do some magic here
                    parseJson(json: data)
                }else{
                    performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
              
                }
            }else{
               performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
            }
        
       
        
    }
    
    func parseJson(json:Data){
        let decoder = JSONDecoder()
        if let json = try? decoder.decode(Petitions.self, from: json){
            pettions = json.results
            DispatchQueue.main.async {[weak self] in
                 self?.tableView.reloadData()
            }
           
            
        }else{
            showError()
        }
    }
    
    @objc func showError(){
     
            let ac = UIAlertController(title: "Error loading", message: "There was error loading Data, please check your connection", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(ac, animated: true)
        
        
    }
}

