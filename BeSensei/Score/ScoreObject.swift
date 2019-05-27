//
//  ScoreObject.swift
//  BeSensei
//
//  Created by Angelina Scheler on 07.06.17.
//  Copyright © 2017 Angelina Scheler. All rights reserved.
//

import UIKit

class ScoreObject: NSObject, NSCoding {
    
    
    //Japanisch auf Latein(Hiragana)
    fileprivate var mode1richtig : Int = 0
    fileprivate var mode1falsch : Int = 0
    fileprivate var arcadeTime1 : Int = 0
    
    //Latein auf Japanisch(Hiragana)
    fileprivate var mode2richtig: Int = 0
    fileprivate var mode2falsch : Int = 0
    fileprivate var arcadeTime2 : Int = 0
    
    //Japanisch auf Latein(Katakana)
    fileprivate var mode3richtig : Int = 0
    fileprivate var mode3falsch : Int = 0
    fileprivate var arcadeTime3 : Int = 0
    
    //Latein auf Japanisch(Katakana)
    fileprivate var mode4richtig : Int = 0
    fileprivate var mode4falsch : Int = 0
    fileprivate var arcadeTime4 : Int = 0
    
    fileprivate let mode1richtigKey = "mode1richtigKey"
    fileprivate let mode1falschKey = "mode1falschKey"
    fileprivate let arcadeTime1Key = "arcadeTime1Key"
    
    fileprivate let mode2richtigKey = "mode2richtigKey"
    fileprivate let mode2falschKey = "mode2falschKey"
    fileprivate let arcadeTime2Key = "arcadeTime2Key"
    
    fileprivate let mode3richtigKey = "mode3richtigKey"
    fileprivate let mode3falschKey = "mode3falschKey"
    fileprivate let arcadeTime3Key = "arcadeTime3Key"
   
    fileprivate let mode4richtigKey = "mode4richtigKey"
    fileprivate let mode4falschKey = "mode4falschKey"
    fileprivate let arcadeTime4Key = "arcadeTime4Key"

    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        doDecoding(aDecoder)
    }
    
    fileprivate func doDecoding(_ aDecoder : NSCoder)
    {

        mode1richtig = aDecoder.decodeInteger(forKey: mode1richtigKey)
        mode1falsch = aDecoder.decodeInteger(forKey: mode1falschKey)
        mode2richtig = aDecoder.decodeInteger(forKey: mode2richtigKey)
        mode2falsch = aDecoder.decodeInteger(forKey: mode2falschKey)
        mode3richtig = aDecoder.decodeInteger(forKey: mode3richtigKey)
        mode3falsch = aDecoder.decodeInteger(forKey: mode3falschKey)
        mode4richtig = aDecoder.decodeInteger(forKey: mode4richtigKey)
        mode4falsch = aDecoder.decodeInteger(forKey: mode4falschKey)
        arcadeTime1 = aDecoder.decodeInteger(forKey: arcadeTime1Key)
        arcadeTime2 = aDecoder.decodeInteger(forKey: arcadeTime2Key)
        arcadeTime3 = aDecoder.decodeInteger(forKey: arcadeTime3Key)
        arcadeTime4 = aDecoder.decodeInteger(forKey: arcadeTime4Key)
        
    }
    
    func encode(with aCoder: NSCoder)
    {
//
        aCoder.encode(mode1richtig, forKey: mode1richtigKey)
        aCoder.encode(mode1falsch, forKey: mode1falschKey)
        aCoder.encode(mode2richtig, forKey: mode2richtigKey)
        aCoder.encode(mode2falsch, forKey: mode2falschKey)
        aCoder.encode(mode3richtig, forKey: mode3richtigKey)
        aCoder.encode(mode3falsch, forKey: mode3falschKey)
        aCoder.encode(mode4richtig, forKey: mode4richtigKey)
        aCoder.encode(mode4falsch, forKey: mode4falschKey)
        aCoder.encode(arcadeTime1, forKey: arcadeTime1Key)
        aCoder.encode(arcadeTime2, forKey: arcadeTime2Key)
        aCoder.encode(arcadeTime3, forKey: arcadeTime3Key)
        aCoder.encode(arcadeTime4, forKey: arcadeTime4Key)
        
    }
    
}

// ######################################################################

//
// Zugriffsschicht
//
extension ScoreObject {

    
    var mode1R : Int {
        get {
            return mode1richtig
        }
        set (newValue) {
            mode1richtig = newValue
        }
    }
    var mode1F : Int {
        get {
            return mode1falsch
        }
        set (newValue) {
            mode1falsch = newValue
        }
    }
    var mode2R : Int {
        get {
            return mode2richtig
        }
        set (newValue) {
            mode2richtig = newValue
        }
    }
    var mode2F : Int {
        get {
            return mode2falsch
        }
        set (newValue) {
            mode2falsch = newValue
        }
    }
    var mode3R : Int {
        get {
            return mode3richtig
        }
        set (newValue) {
            mode3richtig = newValue
        }
    }
    var mode3F : Int {
        get {
            return mode3falsch
        }
        set (newValue) {
            mode3falsch = newValue
        }
    }

    var mode4R : Int {
        get {
            return mode4richtig
        }
        set (newValue) {
            mode4richtig = newValue
        }
    }
    var mode4F : Int {
        get {
            return mode4falsch
        }
        set (newValue) {
            mode4falsch = newValue
        }
    }
    
    var time1 : Int {
        get {
            return arcadeTime1
        }
        set (newValue) {
            arcadeTime1 = newValue
        }
    }
    var time2 : Int {
        get {
            return arcadeTime2
        }
        set (newValue) {
            arcadeTime2 = newValue
        }
    }
    var time3 : Int {
        get {
            return arcadeTime3
        }
        set (newValue) {
            arcadeTime3 = newValue
        }
    }
    var time4 : Int {
        get {
            return arcadeTime4
        }
        set (newValue) {
            arcadeTime4 = newValue
        }
    }
  
   }

// ######################################################################

//
// Persistency Manager
//
class DataObjectPersistency {
    fileprivate let fileName = "data.plist"
    fileprivate let dataKey  = "ScoreObject"
    
    func loadDataObject() -> ScoreObject {
        var item : ScoreObject!
        let file = dataFileForName(fileName)
        
        if (!FileManager.default.fileExists(atPath: file)) {
            return ScoreObject()
        }
        
        if let data = try? Data(contentsOf: URL(fileURLWithPath: file)) {
            let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
            item = (unarchiver.decodeObject(forKey: dataKey) as! ScoreObject)
            unarchiver.finishDecoding()
        }
        
        return item
    }
    
    func saveDataObject(_ items : ScoreObject) {
        let file = dataFileForName(fileName)
        let data = NSMutableData()
        
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(items, forKey: dataKey)
        archiver.finishEncoding()
        data.write(toFile: file, atomically: true)
        
    }
    
    fileprivate func documentPath() -> String {
        let allPathes = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        return allPathes[0]
    }
    
    fileprivate func tmpPath() -> String
    {
        return NSTemporaryDirectory()
    }
    
    fileprivate func dataFileForName(_ fileName : String) -> String {
        return (documentPath() as NSString).appendingPathComponent(fileName)
    }
    
    fileprivate func tmpFileForName(_ fileName : String) -> String {
        return (tmpPath() as NSString).appendingPathComponent(fileName)
    }
    

}
