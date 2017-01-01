//
//  RecordSoundViewController.swift
//  PitchPerfect
//
//  Created by 진형탁 on 2016. 12. 31..
//  Copyright © 2016년 Boostcamp. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController, AVAudioRecorderDelegate {
    var audioRecorder: AVAudioRecorder!
    
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordingButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stopRecordingButton.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func recordAudio(_ sender: Any) {
        // to change view or UI
        recordingLabel.text = "Recording in progress"
        stopRecordingButton.isEnabled = true
        recordingButton.isEnabled = false
        
        // to record voice
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wmv"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: AVAudioSessionCategoryOptions.defaultToSpeaker)
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        // to change view or UI
        recordingLabel.text = "Tap to Record"
        recordingButton.isEnabled = true
        stopRecordingButton.isEnabled = false
        
        // to stop record function
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if (flag) {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url) // 여기서 stopRecording은 storyboard에서 segue
        } else {
            print("recoding was not successful")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording" {
            let playSoundsVC = segue.destination as! PlaySoundViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
            //playSoundsVC 변수를 PlaySoundViewController 클래스의 인스턴스처럼
            // playSoundsVC.recordedAudioURL 는 playsoundviewcontroller에 정의된 변수:
            // PlaySoundViewController 에 audiourl을 알려줌
        }
    }
}

