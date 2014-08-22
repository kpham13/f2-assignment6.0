//
//  DetailViewController.swift
//  Class Roster Part 5
//
//  Created by Kevin Pham on 8/21/14.
//  Copyright (c) 2014 Kevin Pham. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
    var selectedPerson : Person?
    var defaultProfileImage = UIImage(named: "default")

    @IBOutlet weak var fullNameLbl: UILabel!
    @IBOutlet weak var firstNameTxtField: UITextField!
    @IBOutlet weak var lastNameTxtField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstNameTxtField.delegate = self
        self.lastNameTxtField.delegate = self
        
        self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 6 // 2=Circle, 3,4,5=RoundedCorners, 10=
        self.imageView.clipsToBounds = true
        // self.imageView.layer.masksToBounds = true
        self.imageView.layer.borderWidth = 3.0
        self.imageView.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    override func viewWillAppear(animated: Bool) {
        // super.viewWillAppear(true)
        self.fullNameLbl.text = selectedPerson!.fullName()
        self.firstNameTxtField.text = selectedPerson!.firstName
        self.lastNameTxtField.text = selectedPerson!.lastName
        
        if self.selectedPerson!.profileImage != nil {
            self.imageView.image = self.selectedPerson!.profileImage
        } else {
            self.imageView.image = defaultProfileImage
        }
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.selectedPerson?.firstName = self.firstNameTxtField.text
        self.selectedPerson?.lastName = self.lastNameTxtField.text
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func photoButton(sender: UIButton) {
        var imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        // imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        var editedImage = info[UIImagePickerControllerEditedImage] as UIImage
        self.imageView.image = editedImage
        self.selectedPerson!.profileImage = editedImage
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController!) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
