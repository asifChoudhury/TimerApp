//
//  ViewController.swift
//  Timer App
//
//  Created by Md asif choudhury on 8/15/15.
//  Copyright © 2015 BlueFish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    var seconds = 0
    var minutes = 0
    var hours = 0
    var timer = NSTimer()
    var timerOn = false
    
    func incrementTime() {
        seconds++
        if seconds == 60 {
            minutes++
            seconds = 0
        }
        if minutes == 60  {
            hours++
            minutes = 0
        }
        if hours == 12 {
            hours = 0
        }
        let formatter = NSNumberFormatter()
        formatter.minimumIntegerDigits = 2
        
        let secs = formatter.stringFromNumber(seconds)!
        let mins = formatter.stringFromNumber(minutes)!
        let hrs = formatter.stringFromNumber(hours)!
        
        timerLabel.text = "\(hrs) : \(mins) : \(secs)"
    }
    
    @IBAction func play(sender: AnyObject) {
        if !timerOn {
            timerOn = true
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("incrementTime"), userInfo: nil, repeats: true)
        }
    }
    @IBAction func pause(sender: AnyObject) {
        timer.invalidate()
        timerOn  = false
    }
    @IBAction func reset(sender: AnyObject) {
        timer.invalidate()
        seconds = 0
        minutes = 0
        hours = 0
        timerLabel.text = "00 : 00 : 00"
        timerOn = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

