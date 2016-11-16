//
//  DraggableImageView.swift
//  codepath-tinder
//
//  Created by Ernest on 11/14/16.
//  Copyright © 2016 Purpleblue Pty Ltd. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {

    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var imageView: UIImageView!

    var imageOriginalCenter: CGPoint!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initSubviews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }

    func initSubviews() {
        // standard initialization logic
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)

        // custom initialization logic
        // ...
    }

    var image: UIImage? {
        get { return imageView.image }
        set { imageView.image = newValue }
    }
    
    // Photo can slide left and right on the X axis only
    // Ref: https://guides.codepath.com/ios/Using-Gesture-Recognizers
    @IBAction func onPhotoPanGesture(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: contentView)
        print("onPhotoPanGesture.location = \(location)")
        
        // Tell which way a user is panning by looking at the gesture property
        // Like translation, velocity has a value for both x and y components
        // If the y component of the velocity is a positive value, the user is panning down.
        // If the y component is negative, the user is panning up.
        let velocity = sender.velocity(in: contentView)
        print("onPhotoPanGesture.velocity = \(velocity)")
        
        // This will tell us how far our finger has moved from the original "touch-down" point as we drag.
        let translation = sender.translation(in: contentView)
        print("onPhotoPanGesture.translation = \(translation)")
        
        if sender.state == .began {
            print("onPhotoPanGesture.Gesture began")
            
            imageOriginalCenter = imageView.center
            
        } else if sender.state == .changed {
            print("onPhotoPanGesture.Gesture is changing")
            
            // Ignore the x translation because we only want the tray to move up and down hence translation.y
            imageView.center = CGPoint(x: imageOriginalCenter.x + translation.x, y: imageOriginalCenter.y)
            
        } else if sender.state == .ended {
            print("onPhotoPanGesture.Gesture ended")
        }
    }
}
