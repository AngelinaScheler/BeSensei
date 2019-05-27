//
//  ZenDataCtrl.swift
//  BeSensei
//
//  Created by Angelina Scheler on 02.06.17.
//  Copyright © 2017 Angelina Scheler. All rights reserved.
//

import Foundation

class ZenDataCtrl{
    
    let scoreDataCtrl = ScoreDataCtrl.sharedInstance
    let kanaModel = KanaModel()
    var randomLetter: String!
    var randomConvertedLetter: String!
    var random: Int!
    var richtig: Int!
    var falsch: Int!
    
    func makeScore(_ chosenMode: String){
        
        scoreDataCtrl.loadScore()
        
        switch chosenMode {
            
        case "1":
            richtig = scoreDataCtrl.mode1richtig
            falsch = scoreDataCtrl.mode1falsch
            
        case "2":
            richtig = scoreDataCtrl.mode2richtig
            falsch = scoreDataCtrl.mode2falsch
            
        case "3":
            richtig = scoreDataCtrl.mode2richtig
            falsch = scoreDataCtrl.mode2falsch
            
        case "4":
            richtig = scoreDataCtrl.mode3richtig
            falsch = scoreDataCtrl.mode3falsch
            

        default:
            print("fehler bei laden")
        }
    }
    
    func makeLetter(_ chosenMode : String)-> String{
        
        random = Int(arc4random_uniform(UInt32(kanaModel.basicKana.count)))
        randomLetter = kanaModel.basicKana[random]
        
        switch chosenMode {
            //lösen von Japanisch Hiragana mit Lateinischem Buchstaben
        case "1":
            randomConvertedLetter = kanaModel.convertLetterToHiragana(randomLetter)
            return randomConvertedLetter
        case "2":
            //lösen von Lateinischem Buchstaben auf Japanisch Hiragana
            randomConvertedLetter = kanaModel.convertLetterToHiragana(randomLetter)
            return randomLetter
        case "3":
            //lösen von Katakana mit Lateinischem Buchstaben
            randomConvertedLetter = kanaModel.convertLetterToKatakana(randomLetter)
            return randomConvertedLetter
        case "4":
            //lösen von lateinischem Buchstaben mit Katakana
            randomConvertedLetter = kanaModel.convertLetterToKatakana(randomLetter)
            return randomLetter
        
        default:
            return "?"
        }
        
    
    
    }
    
    func checkTheLetter(_ enteredLetter : String,_ chosenMode : String){
    
        let checkLetter = enteredLetter
        
        let trimmCheckLetter = checkLetter.trimmingCharacters(in: .whitespacesAndNewlines)
        
        switch chosenMode {
            
        case "1":
            if randomLetter == trimmCheckLetter{
                richtig = richtig + 1
            }
            else{
                falsch = falsch + 1
            }
        case "2":
            if randomConvertedLetter == trimmCheckLetter{
                richtig = richtig + 1
            }
            else {
                falsch = falsch + 1
            }
        case "3":
            if randomLetter == trimmCheckLetter{
                richtig = richtig + 1
            }
            else{
                falsch = falsch + 1
            }
        case "4":
            if randomConvertedLetter == trimmCheckLetter{
                richtig = richtig + 1
            }
            else {
                falsch = falsch + 1
            }
            
        default:
            print("fehler bei letter check")
        }
   
    }
    
    
}

