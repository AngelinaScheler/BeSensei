//
//  KanaModel.swift
//  BeSensei
//
//  Created by Angelina Scheler on 25.05.17.
//  Copyright © 2017 Angelina Scheler. All rights reserved.
//

import UIKit

class KanaModel {
    
    //phonetische Silben und deren genutzten Verbindungen die in Hiragana und Katakana vorhanden sind
    let basicKana = ["a","i","u","e","o",
                    "ka","ki","ku","ke","ko",
                    "sa","shi","su","se","so",
                    "ta","chi","tsu","te","to",
                    "na","ni","nu","ne","no",
                    "ha","hi","fu","he","ho",
                    "ma","mi","mu","me","mo",
                    "ya","yu","yo",
                    "ra","ri","ru","re","ro",
                    "wa","wo",
                    "n",
                    "ga","gi","gu","ge","go",
                    "za","ji","zu","ze","zo",
                    "da","dji","dzu","de","do",
                    "ba","bi","bu","be","bo",
                    "pa","pi","pu","pe","po",
    
                    "kya","kyu","kyo",
                    "sha","shu","sho",
                    "cha","chu","cho",
                    "nya","nyu","nyo",
                    "hya","hyu","hyo",
                    "mya","myu","myo",
                    "rya","ryu","ryo",
                    "gya","gyu","gyo",
                    "ja","ju","jo",
                    "bya","byu","byo",
                    "pya","pyu","pyo",
                    "fa","fi","fe","fo",
                    "tu","du","ti","di",
                    "she","je","che",
                    "va","we"]
    

    
    
    
    
    func convertLetterToHiragana(_ letter: String) -> String{
        
        var convertedLetter : String = " "
        
        if let convertLetter = letter.applyingTransform(.latinToHiragana, reverse: false){
            convertedLetter = convertLetter
        }
        return convertedLetter
        
        
    }
    
    func convertLetterToKatakana(_ letter: String) -> String{
        var convertedLetter : String = " "
        
        if let convertLetter = letter.applyingTransform(.latinToKatakana, reverse: false){
            convertedLetter = convertLetter
        }
        return convertedLetter
        
        }
    

}
