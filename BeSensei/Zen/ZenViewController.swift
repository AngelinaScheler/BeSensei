//
//  ZenViewController.swift
//  BeSensei
//
//  Created by Angelina Scheler on 25.05.17.
//  Copyright © 2017 Angelina Scheler. All rights reserved.
//

import UIKit

class ZenViewController: UIViewController{
    
    let zenDataCtrl = ZenDataCtrl()
    let scoreDataCtrl = ScoreDataCtrl.sharedInstance
   
    var chosenMode : String!
    var chosenModeShadow : String!
    
    var richtig : Int!
    var falsch : Int!
   
    
    
  
    @IBOutlet weak var falschLabel: UILabel!
    
    @IBOutlet weak var richtigLabel: UILabel!
    
    @IBOutlet weak var letterLabel: UILabel!
    
   
    @IBOutlet weak var myTextField: UITextField!

    @IBAction func CheckAction(_ sender: UIButton) {
        
        
        if let eingabe = myTextField.text{
            
            zenDataCtrl.checkTheLetter(eingabe, chosenMode)
            
        }
        richtig = zenDataCtrl.richtig
        falsch = zenDataCtrl.falsch
        
        richtigLabel.text = String(zenDataCtrl.richtig)
        falschLabel.text = String(zenDataCtrl.falsch)
        
        myTextField.text = ""
        letterLabel.text = zenDataCtrl.makeLetter(chosenMode)
        
    }
    
    @IBAction func quitGameAction(_ sender: UIButton) {
        print("quit")
        
        scoreDataCtrl.getScore(chosenMode, richtig, falsch)
        
        
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        //gewähltes Spiel
        chosenMode = chosenModeShadow
        //spielstand laden
        zenDataCtrl.makeScore(chosenMode)
        richtig = zenDataCtrl.richtig
        falsch = zenDataCtrl.falsch
        //spielstand an Label übergeben
        richtigLabel.text = String(zenDataCtrl.richtig)
        falschLabel.text = String(zenDataCtrl.falsch)
        print("Zen")
        print(chosenMode!)
        //quizstarten
        letterLabel.text = zenDataCtrl.makeLetter(chosenMode)
        myTextField.resignFirstResponder()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
