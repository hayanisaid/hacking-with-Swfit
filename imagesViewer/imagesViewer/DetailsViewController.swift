//
//  DetailsViewController.swift
//  imagesViewer
//
//  Created by mac on 5/25/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var selectedImage :String?
    var imagesCount :Int?
    var imageIndex : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Picture \( imageIndex) of \(imagesCount)"
        navigationItem.largeTitleDisplayMode = .never
        setImageSource ()

        // Do any additional setup after loading the view.
    }
    
    func setImageSource (){
        if let imageSource = selectedImage{
            imageView.image = UIImage(named: imageSource)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
