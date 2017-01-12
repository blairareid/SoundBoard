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
    @IBOutlet weak var playTapped: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    var audioRecorder : AVAudioRecorder?
    var audioPlayer : AVAudioPlayer?
    var audioURL : URL?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Dispable the playButton
        playTapped.isEnabled = false
        
        // Do any additional setup after loading the view.
        setupRecorder()
    }

    
    @IBAction func recordTapped(_ sender: Any) {
        if audioRecorder!.isRecording {
           // Stop the recording, change button title to record
            recordButton.setTitle("Record", for: .normal)
            audioRecorder!.stop()
            // enable button
            playTapped.isEnabled = true
        }
            else{
                // Start the recording
                audioRecorder!.record()
                recordButton.setTitle("Stop", for: .normal)
        }
    
    }
   
    
    @IBAction func playtTapped(_ sender: Any) {
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: audioURL!)
            audioPlayer?.play()
        }
        catch {}
    }
    
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
            audioURL = NSURL.fileURL(withPathComponents: pathComponents)!
            

            // Create Settings for Audio object
            var settings : [String:AnyObject] = [:]
            settings[AVFormatIDKey] = Int(kAudioFormatMPEG4AAC) as AnyObject?
            settings[AVSampleRateKey] = 44100.0 as AnyObject?
            settings[AVNumberOfChannelsKey] = 2 as AnyObject?
            
            
            // Create Audio Record object
            audioRecorder = try AVAudioRecorder(url: audioURL!, settings: settings)
        } catch {}

    }
}
