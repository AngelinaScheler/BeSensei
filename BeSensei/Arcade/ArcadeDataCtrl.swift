//
//  ArcadeDataCtrl.swift
//  BeSensei
//
//  Created by Angelina Scheler on 03.06.17.
//  Copyright © 2017 Angelina Scheler. All rights reserved.
//

import Foundation

class ArcadeDataCtrl {
    let kanaModel = KanaModel()
    var randomLetter : String!
    var randomConvertedLetter : String!
    var randomLetterArray = [String]()
    let scoreDataCtrl = ScoreDataCtrl.sharedInstance
    
    
    
    func makeRandom()-> String{
        let random = Int(arc4random_uniform(UInt32(kanaModel.basicKana.count)))
        let aRandomLetter = kanaModel.basicKana[random]
        
        return aRandomLetter
    }
    
    func makeArray(){
        
        //Array mit 4 zufälligen Silben bzw. Buchstaben
        
        var item = 0
        
        while item <= 3{
        randomLetterArray.append(makeRandom())
        item += 1
        }
    }
    
    func picARandomLetter(){
        
        //Aus dem Array eines Auswählen, dieses muss gelöst werden
        
        let randomLetterInt = Int(arc4random_uniform(UInt32(randomLetterArray.count)))
        randomLetter = randomLetterArray[randomLetterInt]
        
        
    }
    
    func convertArrayToKatakana(){
        
        for (index, value) in randomLetterArray.enumerated(){
            randomLetterArray[index] = kanaModel.convertLetterToKatakana(value)
            
        }
        
    }
    
    func convertArrayToHiragana(){
        
        for (index, value) in randomLetterArray.enumerated(){
            randomLetterArray[index] = kanaModel.convertLetterToHiragana(value)
            
        }
        
    }
    
    func setTime(_ chosenMode : String)-> Int{
        
        scoreDataCtrl.loadScore()
        
        switch chosenMode {
        case "1":
            return scoreDataCtrl.arcadeTime1
        case "2":
            return scoreDataCtrl.arcadeTime2
        case "3":
            return scoreDataCtrl.arcadeTime3
        case "4":
            return scoreDataCtrl.arcadeTime4
        default:
            return 0
        }
        
    }
    
    func makeQuiz(_ chosenMode : String){
        
        switch chosenMode {
            
        //MultipleChoice(MC) in Lateinischen Buchstaben
        case "1":
            
            makeArray()
            picARandomLetter()
            randomConvertedLetter = kanaModel.convertLetterToHiragana(randomLetter)
         
        //MC in Hiragana
        case "2":
            
            makeArray()
            picARandomLetter()
            randomConvertedLetter = kanaModel.convertLetterToHiragana(randomLetter)
            convertArrayToHiragana()
        
        //MC in Lateinischen Buchstaben
            
        case "3":
            
            makeArray()
            picARandomLetter()
            randomConvertedLetter = kanaModel.convertLetterToKatakana(randomLetter)
            
        
        //MC in Katakana
        case "4":
            makeArray()
            picARandomLetter()
            randomConvertedLetter = kanaModel.convertLetterToKatakana(randomLetter)
            convertArrayToKatakana()
       
        default:
            print("fehler beim erstellen vom Quiz")
        }
        
        
    }
    
    func checkChoice(_ chosenMode : String,_ chosenValue: String)-> Int{
        
        switch chosenMode {
        case "1","3":
            if chosenValue == randomLetter{
                return 3
            }else{
                return -3
            }
        case "2","4":
            if chosenValue == randomConvertedLetter{
                return 3
            }else{
                return -3
            }
        default:
            print("beim überprüfen der lösung ist wohl etwas schief gelaufen")
            return 0
        }
        
        
    }
    

  
    
    
    
}
