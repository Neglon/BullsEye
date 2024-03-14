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
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(
            top: 0,
            left: 14,
            bottom: 0,
            right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        // Do any additional setup after loading the view.
        startNewGame()
    }
    
    @IBAction func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }

    @IBAction func showAlert() {
        var difference = currentValue - targetValue
        if difference < 0 {
            difference = -difference
            //could also do difference *= -1
            //could also do let difference = abs(targetValue - currentValue)  abs gives you a number without reguard to its sign, its absolut value, so it is always positive, which is also why difference is defined with let, its value wont change unlike the above examples
        }
        
        var points = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "PERFECT!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Prett good!"
        } else if difference < 20 {
            title = "You need some practice"
        } else {
            title = "Not even close..."
        }
        
        score += points
        
        let message = "You Scored \(points) points!"
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: { _ in
                self.startNewRound()
            })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        
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

