//
//  ViewController.swift
//  Timer
//
//  Created by 姜天姣 on 2019/11/29.
//  Copyright © 2019 姜天姣. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    var timer : Timer!
    var timeCount : Int = 0
    var timerFlag : Int = 0 //set or free
    var pauseFlag : Int = 0
    var stopFlag : Int = 0
    var countTimor : Int = 0
    
    @IBOutlet weak var showTime: NSTextField!
    @IBOutlet weak var historyTimer: NSTextField!
    @IBOutlet weak var backgroundPic: NSImageView!
    
    @IBAction func startCal (_ sender: NSButton) {
        if (timerFlag == 0) {
            countTimor = 0
            timerFlag = 1
            timeCount = 0
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.uptadeTime), userInfo: nil, repeats: true)
        }
        else if (timerFlag == 1) {
            if (pauseFlag == 0) {
                timer.fireDate = Date.distantFuture
                pauseFlag = 1
            }
            else {
                timer.fireDate = Date.distantPast
                pauseFlag = 0
            }
        }
    }

//    @IBAction func pauseContinue (_ sender: NSButton) {
//        if (timerFlag == 1) {
//            if (pauseFlag == 0) {
//                timer.fireDate = Date.distantFuture
//                pauseFlag = 1
//            }
//            else {
//                timer.fireDate = Date.distantPast
//                pauseFlag = 0
//            }
//        }
//    }

    @IBAction func countTime (_ sender: NSButton) {
        countTimor += 1
        historyTimer.stringValue = "\(countTimor))   " + showTime.stringValue + "\n" +  historyTimer.stringValue
    }

    @IBAction func stopReset (_ sender: NSButton) {
        self.timer.invalidate()
        timerFlag = 0
        if (stopFlag == 0) {
            stopFlag = 1
        }
        else {
            timeCount = 0
            stopFlag = 0
            pauseFlag = 0
            showTime.stringValue = "0 : 0 : 0"
            historyTimer.stringValue = ""
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        showTime.textColor = NSColor(red: 112 / 255, green: 192 / 255, blue: 249 / 255, alpha: 1)
        // Do any additional setup after loading the view.
    }

    @objc func uptadeTime() {
        timeCount += 1
        showTime.stringValue = "\(timeCount / 3600 ) : \(timeCount / 60 % 60) : \(timeCount % 60)"
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}
