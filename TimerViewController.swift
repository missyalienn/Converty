//
//  TimerViewController.swift
//  Converty
//
//  Created by Missy Allan on 4/28/17.
//  Copyright © 2017 PandaLabs. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {



    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    
    var timer = Timer()
    var counter = 0.0
    var isTimerRunning = false
   
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red:1.00, green:0.41, blue:0.71, alpha:1.0)
        displayLabel.text = "\(counter)"
        startButton.isEnabled = true
        pauseButton.isEnabled = false
    
        
    }
    
    
    func updateTimer() {
        counter += 0.1
        displayLabel.text = String(format: "%.1f", counter)
       

    }
    


    
    func makeTimeString(time: TimeInterval) -> String {
        
        let hours = Int(time) / 3600
        let minutes = Int(time) * 60 % 60
        let seconds = Int(time) % 60
        
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
        
    }
    

    
    @IBAction func startTapped(_ sender: UIButton) {
        if isTimerRunning == false {
           timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(TimerViewController.updateTimer), userInfo: nil, repeats: true)
            startButton.isEnabled = false
            pauseButton.isEnabled = true
            isTimerRunning = true
            
        }
        
    }
    
    @IBAction func pauseTapped(_ sender: UIButton) {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        timer.invalidate()
        isTimerRunning = false
    
    }
    
    
    @IBAction func resetTapped(_ sender: UIButton) {
        timer.invalidate()
        isTimerRunning = false
        counter = 0
        displayLabel.text = makeTimeString(time: TimeInterval(counter))
        startButton.isEnabled = true
        pauseButton.isEnabled = false

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
