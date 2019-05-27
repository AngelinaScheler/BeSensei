//
//  ScoreDataCtrl.swift
//  BeSensei
//
//  Created by Angelina Scheler on 07.06.17.
//  Copyright © 2017 Angelina Scheler. All rights reserved.
//

import Foundation

class ScoreDataCtrl : NSObject{
    
    static let sharedInstance = ScoreDataCtrl()
    
    private override init()
    {
        super.init()
    }
    
    var scoreData = ScoreObject()
    
    //Japanisch auf Latein(Hiragana)
    var mode1richtig : Int = 0
    var mode1falsch : Int = 0
    var arcadeTime1 : Int = 0
    
    //Latein auf Japanisch(Hiragana)
    var mode2richtig: Int = 0
    var mode2falsch : Int = 0
    var arcadeTime2 : Int = 0
    
    //Japanisch auf Latein(Katakana)
    var mode3richtig : Int = 0
    var mode3falsch : Int = 0
    var arcadeTime3 : Int = 0
    
    //Latein auf Japanisch(Katakana)
    var mode4richtig : Int = 0
    var mode4falsch : Int = 0
    var arcadeTime4 : Int = 0
    
    func getScore(_ chosenMode : String,_ richtig : Int,_ falsch : Int){
        
        switch chosenMode {
        case "1":
            mode1richtig = richtig
            mode1falsch = falsch
            print("\(mode1richtig) und \(mode1falsch)")
            
        case "2":
            mode2richtig = richtig
            mode2falsch = falsch
        case "3":
            mode3richtig = richtig
            mode3falsch = falsch
        case "4":
            mode4richtig = richtig
            mode4falsch = falsch
            
        default:
            print("Fehler bei Übergabe des Ergebnisses")
        }
        
       saveScore()
        
    }
    
    func getTime(_ chosenMode : String,_ playTime : Int){
        switch chosenMode {
        case "1":
            arcadeTime1 = playTime
            
        case "2":
            arcadeTime2 = playTime
            
        case "3":
            arcadeTime3 = playTime
            
        case "4":
            arcadeTime4 = playTime
            
        default:
            print("Fehler bei Übergabe der Spielzeit")
        }
        
        saveTime()

    }
    
    func deleteScore(){
        mode1richtig = 0
        mode1falsch = 0
        arcadeTime1 = 0
        
        mode2richtig = 0
        mode2falsch = 0
        arcadeTime2 = 0
        
        mode3richtig = 0
        mode3falsch = 0
        arcadeTime3 = 0
        
        mode4richtig = 0
        mode4falsch  = 0
        arcadeTime4 = 0
        
        
        saveScore()
        saveTime()
    }
    
    
    func saveScore(){
        
        print("saved")
        
        scoreData.mode1R = mode1richtig
        scoreData.mode1F = mode1falsch
        
        scoreData.mode2R = mode2richtig
        scoreData.mode2F = mode2falsch
        
        scoreData.mode3R = mode3richtig
        scoreData.mode3F = mode3falsch
        
        scoreData.mode4R = mode4richtig
        scoreData.mode4F = mode4falsch
        
        DataObjectPersistency().saveDataObject(scoreData)
        
    }
    
    func saveTime(){
        print("save Time")
        
        scoreData.time1 = arcadeTime1
        scoreData.time2 = arcadeTime2
        scoreData.time3 = arcadeTime3
        scoreData.time4 = arcadeTime4
        
        DataObjectPersistency().saveDataObject(scoreData)
    }
    
    func loadScore(){
        
        scoreData = DataObjectPersistency().loadDataObject()
        
        mode1richtig = scoreData.mode1R
        mode1falsch = scoreData.mode1F
        arcadeTime1 = scoreData.time1
        
        mode2richtig = scoreData.mode2R
        mode2falsch = scoreData.mode2F
        arcadeTime2 = scoreData.time2
        
        mode3richtig = scoreData.mode3R
        mode3falsch = scoreData.mode3F
        arcadeTime3 = scoreData.time3
        
        mode4richtig = scoreData.mode4R
        mode4falsch = scoreData.mode4F
        arcadeTime4 = scoreData.time4
        
        
    }
    

    
}
