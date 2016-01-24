//
//  PumpingViewController.swift
//  Myo Gainz
//
//  Created by Domingo on 2016-01-23.
//  Copyright © 2016 Myo Something. All rights reserved.
//

import UIKit

class PumpingViewController: UIViewController {
    
    @IBOutlet var repsCounter: UILabel!
    
    @IBOutlet var finishedLabel: UILabel!
    
    private var press: Press!
    
    private var doneLifting: Bool!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneLifting = false
        press = Press (g: 4, vc1: self)
        finishedLabel.hidden = true

        NSNotificationCenter .defaultCenter() .addObserver(self, selector: "didReceiveAccelerometerEvent:", name: TLMMyoDidReceiveAccelerometerEventNotification, object: nil)
        
        NSNotificationCenter .defaultCenter() .addObserver(self, selector: "didReceivePoseChangedEvent:", name: TLMMyoDidReceivePoseChangedNotification, object: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func finishedWorkout() {
        
        let file = "file.txt" 
        
        let text = "some text"
        
        if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            let path = dir.stringByAppendingPathComponent(file);
            
            //writing
            do {
                try text.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding)
            }
            catch {/* error handling here */}
            
            //reading
            do {
                let text2 = try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            }
            catch {/* error handling here */}
        }
    }
    
    func didReceiveAccelerometerEvent (notification: NSNotification) {
        press.determineDirection(notification)
    }
    
    func didReceivePoseChangedEvent (notification: NSNotification) {
        if (notification.userInfo![kTLMKeyPose] as! TLMPoseType == TLMPoseType.Fist && !doneLifting) {
            //user starts grabbing bar
            press.startGrabbing()
        }
        
        if (notification.userInfo![kTLMKeyPose] as! TLMPoseType == TLMPoseType.WaveIn) {
            //wave in gesture. User does another set
            resetPress()
        }
    }
    
    func sendVibration (length: TLMVibrationLength) {
        TLMHub.sharedHub().myoDevices()[0].vibrateWithLength(length)
    }
    
    func finishLifting () {
        sendVibration(TLMVibrationLength.Long)
        doneLifting = true
        finishedLabel.hidden = false
        finishedWorkout()
    }
    
    func resetPress() {
        doneLifting = false
        finishedLabel.hidden = true
        press = Press(g: 4, vc1: self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}