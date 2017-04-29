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
    
    var seconds = 60  //hold starting value of seconds
    var timer = Timer()
    var isTimerRunning = false  //only create 1 timer at a time
    var resumeTapped = false //has pause been tapped before or not?
    
    
    
    
    @IBAction func startTapped(_ sender: UIButton) {
        if isTimerRunning == false {
            runTimer()
        }

        
    }
    
    @IBAction func pauseTapped(_ sender: UIButton) {
        if resumeTapped == false {
            timer.invalidate()
            self.resumeTapped = true
        }else{
             self.runTimer()
            self.resumeTapped = false
        }
    }
    
    
    
    @IBAction func resetTapped(_ sender: UIButton) {
        timer.invalidate()
        seconds = 0
        displayLabel.text = makeTimeString(time: TimeInterval(seconds))
        isTimerRunning = false
    }
    
    
    

    func updateTimer() {
        
        if seconds < 1 {
            timer.invalidate()
        }else{
            seconds -= 1
            displayLabel.text = makeTimeString(time: TimeInterval(seconds))
            
        }
        
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerViewController.updateTimer), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    func makeTimeString(time: TimeInterval) -> String {
        
        let hours = Int(time) / 3600
        let minutes = Int(time) * 60 % 60
        let seconds = Int(time) % 60
        
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red:1.00, green:0.41, blue:0.71, alpha:1.0)
        
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
