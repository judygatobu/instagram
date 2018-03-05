//
//  PhotoMapViewController.swift
//  instagram
//
//  Created by Judy Gatobu on 2/28/18.
//  Copyright © 2018 Judy Gatobu. All rights reserved.
//

import UIKit

    class PhotoMapViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = UIImagePickerController()
        vci.delegate = self
        vci.allowsEditing = true
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("Camera is available 📸")
            vc.sourceType = .camera
        } else {
            print("Camera 🚫 available so we will use photo library instead")
            vci.sourceType = .photoLibrary
        }

}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let vc = UIImagePickerController()
    vci.delegate = self
    vci.allowsEditing = true
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
    print("Camera is available 📸")
    vc.sourceType = .camera
    } else {
    print("Camera 🚫 available so we will use photo library instead")
    vci.sourceType = .photoLibrary
    }
    
    self.present(vc, animated: true, completion: nil)

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        // Do something with the images (based on your use case)
        
        //seague
        
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
}
let vc = UIImagePickerController()
vc.delegate = self
vc.allowsEditing = true
vc.sourceType = UIImagePickerControllerSourceType.photoLibrary

self.present(vc, animated: true, completion: nil)

func imagePickerController(_ picker: UIImagePickerController,
                           didFinishPickingMediaWithInfo info: [String : Any]) {
    // Get the image captured by the UIImagePickerController
    let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
    let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
    
    // Do something with the images (based on your use case)
    
    // Dismiss UIImagePickerController to go back to your original view controller
    dismiss(animated: true, completion: nil)
}


