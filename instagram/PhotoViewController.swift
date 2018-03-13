//
//  PhotoViewController.swift
//  instagram
//
//  Created by Judy Gatobu on 3/13/18.
//  Copyright © 2018 Judy Gatobu. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var ImageTaken: UIImageView!
    @IBOutlet weak var captionField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    /*    let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(vc, animated: true, completion: nil)
        
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("Camera is available 📸")
            vc.sourceType = .camera
        } else {
            print("Camera 🚫 available so we will use photo library instead")
            vc.sourceType = .photoLibrary
        }*/
        
    //    TakePic()

        // Do any additional setup after loading the view.
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        
        ImageTaken.image = originalImage
      //  let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        // Do something with the images (based on your use case)
        
        

        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func displayAlert(_ title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
        
        
        
        
        
    }
    
    
    
    @IBAction func takePick(_ sender: Any) {
        
         TakePic()
    }
    
    
     func TakePic() {
        
      let optionMenu = UIAlertController(title: nil, message: "Use Camera to take picture of the item", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        
        let cancelHandler = { (action:UIAlertAction!) -> Void in
            
            self.dismiss(animated: true, completion: {});
            
        }
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: cancelHandler)
        optionMenu.addAction(cancelAction)
        
        
        
        
        let TakePictureHandler = { (action:UIAlertAction!) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .camera
                imagePicker.delegate = self
                
                
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        
        
        let TakeAPicture = UIAlertAction(title: "Take Photo or Video ", style: UIAlertActionStyle.default, handler: TakePictureHandler)
        optionMenu.addAction(TakeAPicture)
        
        
        
        let LoadPictureHandler = { (action:UIAlertAction!) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .photoLibrary
                imagePicker.delegate = self
                
                
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        
        
        let LoadAPicture = UIAlertAction(title: "Load Photo From Library ", style: UIAlertActionStyle.default, handler: LoadPictureHandler)
        optionMenu.addAction(LoadAPicture)
        
        
        
        
        
        self.present(optionMenu, animated: true, completion: nil)
        
        
        //    present(imagePicker, animated: true, completion: nil)
        
    }

    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapOnPostButton(_ sender: Any) {
        
        
        
        Post.postUserImage(image: ImageTaken.image, withCaption: captionField.text, withCompletion: { (success, error) in
            
            
            //  UIApplication.shared.endIgnoringInteractionEvents()
            
            
            
            if (success) {
                self.displayAlert("Image Posted!", message: "Your image has been posted successfully")
                
                //   self.performSegue(withIdentifier: "showSegue", sender: self)
                
                
                // The object has been saved.
            } else {
                // There was a problem, check error.description
                self.displayAlert("Could not post image", message: "Please try again later")
                
            }
        })
        

        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
