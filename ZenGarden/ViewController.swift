//
//  ViewController.swift
//  ZenGarden
//
//  Created by Flatiron School on 6/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var rakeImage: UIImageView!
    @IBOutlet weak var rockImage: UIImageView!
    @IBOutlet weak var shrubImage: UIImageView!
    @IBOutlet weak var swordInRockImage: UIImageView!
    
    //y
    var rockTop: NSLayoutConstraint?
    var rakeTop: NSLayoutConstraint?
    var swordTop: NSLayoutConstraint?
    var shrubTop: NSLayoutConstraint?
    
    //x
    var rockLeft: NSLayoutConstraint?
    var rakeLeft: NSLayoutConstraint?
    var swordLeft: NSLayoutConstraint?
    var shrubLeft: NSLayoutConstraint?
    
    var rockDifference: CGPoint?
    var rakeDifference: CGPoint?
    var swordDifference: CGPoint?
    var shrubDifference: CGPoint?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        rakeImage.userInteractionEnabled = true
        rockImage.userInteractionEnabled = true
        shrubImage.userInteractionEnabled = true
        swordInRockImage.userInteractionEnabled = true
        
        reset()
        
        
    }
    
    func rockImageDrag(recognizer:UIPanGestureRecognizer) {
        
        let coordinates = recognizer.translationInView(self.rockImage)
        
        if recognizer.state == .Began {
            
            self.rockDifference = coordinates
            
        } else {
            
            if let differencePoint = self.rockDifference {
                
                let diffY = coordinates.y - differencePoint.y
                let diffX = coordinates.x - differencePoint.x
                
                self.rockTop?.constant += diffY
                self.rockLeft?.constant += diffX
                self.rockDifference = coordinates
                
                checkForWin()

            }
        }
        
    }
    
    func rakeImageDrag(recognizer:UIPanGestureRecognizer) {
        
        let coordinates = recognizer.translationInView(self.rakeImage)
        
        if recognizer.state == .Began {
            
            self.rakeDifference = coordinates
            
        } else {
            
            if let differencePoint = self.rakeDifference {
                
                let diffY = coordinates.y - differencePoint.y
                let diffX = coordinates.x - differencePoint.x
                
                self.rakeTop?.constant += diffY
                self.rakeLeft?.constant += diffX
                self.rakeDifference = coordinates
                
                checkForWin()
            }
        }
        
    }
    
    func swordImageDrag(recognizer:UIPanGestureRecognizer) {
        
        let coordinates = recognizer.translationInView(self.swordInRockImage)
        
        if recognizer.state == .Began {
            
            self.swordDifference = coordinates
            
        } else {
            
            if let differencePoint = self.swordDifference {
                
                let diffY = coordinates.y - differencePoint.y
                let diffX = coordinates.x - differencePoint.x
                
                self.swordTop?.constant += diffY
                self.swordLeft?.constant += diffX
                self.swordDifference = coordinates
                
                checkForWin()
            }
        }
        
    }
    
    func shrubImageDrag(recognizer:UIPanGestureRecognizer) {
        
        let coordinates = recognizer.translationInView(self.shrubImage)
        
        if recognizer.state == .Began {
            
            self.shrubDifference = coordinates
            
        } else {
            
            if let differencePoint = self.shrubDifference {
                
                let diffY = coordinates.y - differencePoint.y
                let diffX = coordinates.x - differencePoint.x
                
                self.shrubTop?.constant += diffY
                self.shrubLeft?.constant += diffX
                self.shrubDifference = coordinates
                
                checkForWin()
            }
        }
        
    }
    
    func reset() {
        
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.removeConstraints(self.view.constraints)
        self.rakeImage.translatesAutoresizingMaskIntoConstraints = false
        self.rakeImage.removeConstraints(self.rakeImage.constraints)
        self.rockImage.translatesAutoresizingMaskIntoConstraints = false
        self.rockImage.removeConstraints(self.rockImage.constraints)
        self.shrubImage.translatesAutoresizingMaskIntoConstraints = false
        self.shrubImage.removeConstraints(self.shrubImage.constraints)
        self.shrubImage.translatesAutoresizingMaskIntoConstraints = false
        self.shrubImage.removeConstraints(self.swordInRockImage.constraints)
        
        
        self.rakeImage.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.20).active = true
        self.rakeImage.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.20).active = true
        self.rakeLeft = self.rakeImage.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor, constant: CGFloat(arc4random_uniform(200)))
        self.rakeLeft!.active = true
        self.rakeTop = self.rakeImage.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor, constant: CGFloat(arc4random_uniform(200)))
        self.rakeTop!.active = true
        
        self.rockImage.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.20).active = true
        self.rockImage.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.20).active = true
        self.rockLeft = self.rockImage.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor, constant: CGFloat(arc4random_uniform(200)))
        self.rockLeft!.active = true
        self.rockTop = self.rockImage.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor, constant: CGFloat(arc4random_uniform(200)))
        self.rockTop!.active = true
        
        self.shrubImage.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.20).active = true
        self.shrubImage.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.20).active = true
        self.shrubLeft = self.shrubImage.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor, constant: CGFloat(arc4random_uniform(200)))
        self.shrubLeft!.active = true
        self.shrubTop = self.shrubImage.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor, constant: CGFloat(arc4random_uniform(200)))
        self.shrubTop!.active = true
        
        self.swordInRockImage.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.20).active = true
        self.swordInRockImage.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.20).active = true
        self.swordLeft = self.swordInRockImage.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor, constant: CGFloat(arc4random_uniform(200)))
        self.swordLeft!.active = true
        self.swordTop = self.swordInRockImage.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor, constant: CGFloat(arc4random_uniform(200)))
        self.swordTop!.active = true
        
        let rockImageDrag = UIPanGestureRecognizer.init(target:self, action: #selector(self.rockImageDrag))
        let rakeImageDrag = UIPanGestureRecognizer.init(target:self, action: #selector(self.rakeImageDrag))
        let swordImageDrag = UIPanGestureRecognizer.init(target:self, action: #selector(self.swordImageDrag))
        let shrubImageDrag = UIPanGestureRecognizer.init(target: self, action: #selector(self.shrubImageDrag))
        
        
        self.rockImage.addGestureRecognizer(rockImageDrag)
        self.rakeImage.addGestureRecognizer(rakeImageDrag)
        self.swordInRockImage.addGestureRecognizer(swordImageDrag)
        self.shrubImage.addGestureRecognizer(shrubImageDrag)
    }
    
    func checkForWin(){
        
        var swordWinPosition = false
        var rockWinPosition = false
        var rakeAndShrubWinPosition = false
        var winner = false
        
        
        
        if self.swordLeft!.constant < -150.0  || self.swordTop!.constant < -333 && self.swordLeft!.constant < -150{
            swordWinPosition = true
            
            print(swordWinPosition)
            print ("Correct Sword!")
            
        }
        
        
        if let swordDiff = swordDifference, rockDiff = rockDifference {
            
            if abs(swordDiff.y - rockDiff.y) > 399 {
                rockWinPosition = true
                
                print(rockWinPosition)
                print ("Rock!")
            }
        }
        
        
        if let shrubDiff = shrubDifference, rakeDiff = rakeDifference {
            
            if  abs(shrubDiff.y - rakeDiff.y) < 3 {
                rakeAndShrubWinPosition = true
                
                print(rakeAndShrubWinPosition)
                print ("Correct Rake and Shrub!")
            }
        }
        
        if rockWinPosition && rakeAndShrubWinPosition && swordWinPosition  {
            winner = true
        }
        
        if winner {
            let alert = UIAlertController(title: "Winner!", message: "Great Job!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Play Again?", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            winner = true
            
            reset()
        }
        
    }
    

}
