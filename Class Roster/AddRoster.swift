//
//  AddRoster.swift
//  Class Roster Part 5
//
//  Created by Kevin Pham on 8/21/14.
//  Copyright (c) 2014 Kevin Pham. All rights reserved.
//

import UIKit

class AddRoster: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    var defaultProfileImage = UIImage(named: "default")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // self.navigationController.delegate = self
        
        self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 6 // 2=Circle, 3,4,5=RoundedCorners, 10=
        self.imageView.clipsToBounds = true
        // self.imageView.layer.masksToBounds = true
        self.imageView.layer.borderWidth = 3.0
        self.imageView.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    override func viewWillAppear(animated: Bool) {
        // super.viewWillAppear(true)
        self.imageView.image = defaultProfileImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
