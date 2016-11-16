//
//  CardsViewController.swift
//  codepath-tinder
//
//  Created by Ernest on 11/13/16.
//  Copyright © 2016 Purpleblue Pty Ltd. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var photoImageView: DraggableImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        photoImageView.image = UIImage(named: "ernest-semerda")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goToProfileView() {
        self.performSegue(withIdentifier: "ProfileViewSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ProfileViewSegue" {
            // Get a reference to the detail view controller
            let destinationViewController = segue.destination as! ProfileViewController
            
            // Pass the flat canvas to export
            destinationViewController.photoImage = photoImageView.image
        }
    }
    
}

