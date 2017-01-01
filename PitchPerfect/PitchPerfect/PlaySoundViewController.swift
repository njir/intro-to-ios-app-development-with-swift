//
//  PlaySoundViewController.swift
//  PitchPerfect
//
//  Created by 진형탁 on 2017. 1. 1..
//  Copyright © 2017년 Boostcamp. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {
    var recordedAudioURL: URL!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var slowButton: UIButton!
    
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    
    var recordedAudioURL: URL!
    
    @IBAction func playSoundForButton (_ sender: UIButton) {
        print("play sound for button")
    }
    
    @IBAction func stopButtonPressed (_ sender: UIButton) {
        print("stop button pressed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
