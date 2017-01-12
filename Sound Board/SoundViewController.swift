//
//  SoundViewController.swift
//  Sound Board
//
//  Created by Blair Reid on 2017-01-12.
//  Copyright © 2017 Blair Reid. All rights reserved.
//

import UIKit
import AVFoundation    // Needed to give access to audio stuff

class SoundViewController: UIViewController {


    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    
    //Setup audio class
    var audioRecord : AVAudioRecorder?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupRecorder()
        
    }
    
    func setupRecorder() {
        // Create Audio Session
        let session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        session.overrideOutputAudioPort(.speaker)
        session.setActive(true)
        
        // Create URL for Audio
        
        // Create Settings for Audio object
        
        // Create Audio Record object
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func recordTapped(_ sender: Any) {
    }
 
    @IBAction func playTapped(_ sender: Any) {
    }
   
    @IBAction func addTapped(_ sender: Any) {
    }
  
    
}
