//
//  ToyViewController.swift
//  ToyCollector
//
//  Created by Michael Cruz on 9/19/16.
//  Copyright © 2016 MIchael Cruz. All rights reserved.
//

import UIKit

class ToyViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var toyimageView: UIImageView!
    
    
    @IBOutlet weak var titleTextField: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        
    }

    
    @IBAction func photosTapped(_ sender: AnyObject) {
    
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        toyimageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cameraTapped(_ sender: AnyObject) {
        
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    
    }
    
    
    
    
    @IBAction func addTapped(_ sender: AnyObject) {
        
        let context = (UIApplication.shared.delegate as!        AppDelegate).persistentContainer.viewContext
        
        let toy = Toy(context: context)
        toy.title = titleTextField.text
        toy.image = UIImagePNGRepresentation(toyimageView.image!) as NSData?
        
        (UIApplication.shared.delegate as!        AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
    }
    
}
