//
//  ZeichenTabelleViewController.swift
//  BeSensei
//
//  Created by Angelina Scheler on 08.06.17.
//  Copyright © 2017 Angelina Scheler. All rights reserved.
//

import UIKit
import AVFoundation

class ZeichenTabelleViewController: UIViewController {
    
    
    
    
    @IBOutlet var zeichenButtonLabel: [UIButton]!
    
   
   
    
    
    @IBOutlet weak var changeTranslationSegment: UISegmentedControl!
    
    @IBAction func switchSegmentAction(_ sender: UISegmentedControl) {
        
        //zurücksetzen der Button Labels zu Lateinischen Buchstaben
        
        for button in zeichenButtonLabel{
            button.setTitle(button.currentTitle?.applyingTransform(.toLatin, reverse: false)?.uppercased(), for: .normal)
            
            button.isMultipleTouchEnabled = false
            
        }
        
    }
        

    
    
    
    
    @IBAction func translateAction(_ sender: UIButton) {
        
        let index = changeTranslationSegment.selectedSegmentIndex
        
        
        
        
        if sender.isMultipleTouchEnabled == false{
        switch index {
        case 0:
            sender.setTitle(sender.currentTitle?.applyingTransform(.latinToHiragana, reverse: false)?.uppercased(), for: .normal)
            makeSpeech(sender.currentTitle!)
            sender.isMultipleTouchEnabled = true
            
            
            
        case 1:
           
            sender.setTitle(sender.currentTitle?.applyingTransform(.latinToKatakana, reverse: false)?.uppercased(), for: .normal)
            makeSpeech(sender.currentTitle!)
            sender.isMultipleTouchEnabled = true
            
            
        default:
            print("fehler bei convertLetter")
        }
        }else{
            makeSpeech(sender.currentTitle!)
            sender.setTitle(sender.currentTitle!.applyingTransform(.toLatin, reverse: false)?.uppercased(), for: .normal)
            
            sender.isMultipleTouchEnabled = false
        }
        
        
        
    }
    
    func makeSpeech(_ buttonText: String){
        let synthesizer = AVSpeechSynthesizer()

        let speakIt = AVSpeechUtterance(string: buttonText)
        speakIt.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        speakIt.rate = 0.1
        synthesizer.speak(speakIt)
        
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
