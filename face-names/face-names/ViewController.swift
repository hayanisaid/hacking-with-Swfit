//
//  ViewController.swift
//  face-names
//
//  Created by admin on 7/11/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UICollectionViewDelegateFlowLayout {
    var people = [Person]()
    let inset: CGFloat = 10
    let minimumLineSpacing: CGFloat = 3
    let minimumInteritemSpacing: CGFloat = 4
    let cellsPerRow = 3
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPerson))
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumLineSpacing
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInteritemSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let marginsAndInsets = inset * 2 + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
        
        
        let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    @objc func addPerson(){
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker,animated: true)
        
    }
    // get media from picker
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {return}
        let imageName = UUID().uuidString
       let imagePath = getDocumnetDirectory().appendingPathComponent(imageName)
        
        
        
        if  let jpegData = image.jpegData(compressionQuality: 0.8){
            try? jpegData.write(to: imagePath)
        }
        
        let person = Person(name: "Unkown", image: imageName)
         people.append(person)
        collectionView.reloadData()
        
    dismiss(animated: true)
        
    }
    
    func getDocumnetDirectory()-> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return people.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonCell", for: indexPath) as? PersonCellCollectionViewCell else{
            fatalError("unable to get collectionView")
        }
        
        let person = people[indexPath.row]
        cell.labelView.text = person.name
        let path = getDocumnetDirectory().appendingPathComponent(person.image)
        cell.ImageVeiew.image = UIImage(contentsOfFile: path.path)
        cell.ImageVeiew.layer.borderColor = UIColor(white: 0, alpha: 0.8).cgColor
        cell.ImageVeiew.layer.borderWidth = 2
        cell.layer.cornerRadius = 7
        
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let person = people[indexPath.item]
        
        let ac = UIAlertController(title: "Rename a 🙎‍♂️", message: nil, preferredStyle:.alert)
        
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        ac.addAction(UIAlertAction(title: "OK", style: .default){[weak self, weak ac] _ in
            guard let newName = ac?.textFields?[0].text else{return}
            person.name = newName
            
            self?.collectionView.reloadData()
            
            
        })
        
        present(ac,animated: true)
        
    }

}

