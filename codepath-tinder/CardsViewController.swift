//
//  CardsViewController.swift
//  codepath-tinder
//
//  Created by Ernest on 11/13/16.
//  Copyright © 2016 Purpleblue Pty Ltd. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    var photoOriginalCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Photo can slide left and right on the X axis only
    // Ref: https://guides.codepath.com/ios/Using-Gesture-Recognizers
    @IBAction func onPhotoPanGesture(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        print("onPhotoPanGesture.location = \(location)")
        
        // Tell which way a user is panning by looking at the gesture property
        // Like translation, velocity has a value for both x and y components
        // If the y component of the velocity is a positive value, the user is panning down.
        // If the y component is negative, the user is panning up.
        let velocity = sender.velocity(in: view)
        print("onPhotoPanGesture.velocity = \(velocity)")
        
        // This will tell us how far our finger has moved from the original "touch-down" point as we drag.
        let translation = sender.translation(in: view)
        print("onPhotoPanGesture.translation = \(translation)")
        
        if sender.state == .began {
            print("onPhotoPanGesture.Gesture began")
            
            photoOriginalCenter = photoImageView.center
            
            
        } else if sender.state == .changed {
            print("onPhotoPanGesture.Gesture is changing")
            
            // Ignore the x translation because we only want the tray to move up and down hence translation.y
            photoImageView.center = CGPoint(x: photoOriginalCenter.x + translation.x, y: photoOriginalCenter.y)
            
        } else if sender.state == .ended {
            print("onPhotoPanGesture.Gesture ended")
            
        }
    }
}

