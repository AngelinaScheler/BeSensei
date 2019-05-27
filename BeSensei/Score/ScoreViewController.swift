//
//  ScoreViewController.swift
//  BeSensei
//
//  Created by Angelina Scheler on 07.06.17.
//  Copyright © 2017 Angelina Scheler. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    
    
    

    let scoreDataCtrl = ScoreDataCtrl.sharedInstance
    
    
    
    @IBOutlet weak var mode1FLabel: UILabel!
    @IBOutlet weak var mode1RLabel: UILabel!
    @IBOutlet weak var arcadeTime1: UILabel!
    

    @IBOutlet weak var mode2FLabel: UILabel!
    @IBOutlet weak var mode2RLabel: UILabel!
    @IBOutlet weak var arcadeTime2: UILabel!
    

    @IBOutlet weak var mode3FLabel: UILabel!
    @IBOutlet weak var mode3RLabel: UILabel!
    @IBOutlet weak var arcadeTime3: UILabel!
    
    @IBOutlet weak var mode4FLabel: UILabel!
    @IBOutlet weak var mode4RLabel: UILabel!
    @IBOutlet weak var arcadeTime4: UILabel!
    
    
    func setScore(){
        
        mode1FLabel.text = String(scoreDataCtrl.mode1falsch)
        mode1RLabel.text = String(scoreDataCtrl.mode1richtig)
        arcadeTime1.text = String(scoreDataCtrl.arcadeTime1)
        
        mode2FLabel.text = String(scoreDataCtrl.mode2falsch)
        mode2RLabel.text = String(scoreDataCtrl.mode2richtig)
        arcadeTime2.text = String(scoreDataCtrl.arcadeTime2)
        
        mode3FLabel.text = String(scoreDataCtrl.mode3falsch)
        mode3RLabel.text = String(scoreDataCtrl.mode3richtig)
        arcadeTime3.text = String(scoreDataCtrl.arcadeTime3)
        
        mode4FLabel.text = String(scoreDataCtrl.mode4falsch)
        mode4RLabel.text = String(scoreDataCtrl.mode4richtig)
        arcadeTime4.text = String(scoreDataCtrl.arcadeTime4)
    }

    @IBAction func deleteScores(_ sender: UIButton) {
        
        let actionSheetController = UIAlertController(title: "Do you wanna delete your LAST SCORES?", message: "tap \"YES DELETE!\"!", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "CANCEL", style: .cancel){
            action -> Void in print("Cancel pressed")
        }
        actionSheetController.addAction(cancelAction)
        
        let enterAction = UIAlertAction(title: "YES DELETE!", style: .default) {
            action ->
            Void in self.scoreDataCtrl.deleteScore()
             self.viewDidLoad()
            
            
        }
        
        actionSheetController.addAction(enterAction)
        let popover = actionSheetController.popoverPresentationController
        if let popover = popover{
            popover.sourceView  = sender
            popover.sourceRect = sender.bounds
            popover.permittedArrowDirections = .any
        }
        self.present(actionSheetController, animated: true){
            () -> Void in print("Delete Action")
        }

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreDataCtrl.loadScore()
        setScore()
        
    }
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
