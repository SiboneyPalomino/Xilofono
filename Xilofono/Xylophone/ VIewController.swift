//
//  ViewController.swift
//  Xylophone
//
//  Created by siboney.rios on 08/05/2019.
//  Copyright © 2019 siboney.rios All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate{
   
    var audioPlayer: AVAudioPlayer?
    
    var selectedSoundFileName: String = ""
    let soundArray = ["note1","note2","note3","note4","note5","note6","note7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func notePressed(_ sender: UIButton) {
        self.selectedSoundFileName = soundArray[sender.tag - 1]
        print(selectedSoundFileName)
        
        playSound()
    }
    
    func playSound(){
        
        guard let url = Bundle.main.url(forResource: selectedSoundFileName, withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            guard let aPlayer = audioPlayer else { return }
            aPlayer.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
  

}

