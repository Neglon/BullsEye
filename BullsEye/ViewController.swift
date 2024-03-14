//
//  ViewController.swift
//  BullsEye
//
//  Created by Thomas Neylon on 3/14/24.
//

import UIKit

class ViewController: UIViewController {
    //the outlet allows the slider to be scoped within the view controller
    //the slider from the storyboard needed to be connect with ctrl click to this outlet
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var round = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startNewRound()
    }

    @IBAction func showAlert() {
        var difference = currentValue - targetValue
        if difference < 0 {
            difference = -difference
            //could also do difference *= -1
            //could also do let difference = abs(targetValue - currentValue)  abs gives you a number without reguard to its sign, its absolut value, so it is always positive, which is also why difference is defined with let, its value wont change unlike the above examples
        }
        
        let points = 100 - difference
        score += points
        
        
        let message = "You Scored \(points) points!"
        
        let alert = UIAlertController(
            title: "Hello, World",
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        //print("The value of the slider is now: \(slider.value)")
        // lroundf() takes a non whole number and rounds to the nearest whole number
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        round += 1
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }

}

