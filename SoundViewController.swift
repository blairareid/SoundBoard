//
//  SoundViewController.swift
//  Sound Board
//
//  Created by Blair Reid on 2017-01-12.
//  Copyright © 2017 Blair Reid. All rights reserved.
//

import UIKit
import AVFoundation

class SoundViewController: UIViewController {


    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var soundTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupRecorder()
    }

    
    @IBAction func recordTapped(_ sender: Any) {
    }
  
    @IBOutlet weak var playTapped: UIButton!
    
    @IBAction func addTapped(_ sender: Any) {
    }
    
    
    func setupRecorder() {
        do {
            
            // Create Audio Session
            let session = AVAudioSession.sharedInstance()
            
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try session.overrideOutputAudioPort(.speaker)
            try session.setActive(true)
            
            // Create URL for Audio
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try session.overrideOutputAudioPort(.speaker)
            try session.setActive(true)
            
            // Create URL for Audio
            let basePath : String = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true).first!
            
            
            let pathComponents = [basePath, "audio.m4a"]
            let audioURL = NSURL.fileURL(withPathComponents: pathComponents)!
            

            // Create Settings for Audio object
            var settings : [String:AnyObject] = [:]
            settings[AVFormatIDKey] = Int(kAudioFormatMPEG4AAC) as AnyObject?
            settings[AVSampleRateKey] = 44100.0 as AnyObject?
            settings[AVNumberOfChannelsKey] = 2 as AnyObject?
            
            
            // Create Audio Record object
            let audioRecorder = try AVAudioRecorder(url: audioURL, settings: settings)
        } catch {}

    }
}
