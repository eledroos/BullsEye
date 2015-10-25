//
//  ViewController.swift
//  BullsEye
//
//  Created by Nasser Eledroos on 10/21/15.
//  Copyright © 2015 Nasser Eledroos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue = 0
    var targetValue = 0
    var score = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value) //rounds slider value to neared whole float number
    }
    
    @IBAction func showAlert() {
        var title: String = ""
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        
        
        let message = "Your score )"
        
        if currentValue == targetValue {
            title = "Nice job!"
        } else {
            title = "Try Again"
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        startNewRound()
        updateLabels()
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100)) // 1 + (random number from 0-99)
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }


}

