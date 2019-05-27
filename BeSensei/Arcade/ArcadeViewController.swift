//
//  ArcadeViewController.swift
//  BeSensei
//
//  Created by Angelina Scheler on 25.05.17.
//  Copyright © 2017 Angelina Scheler. All rights reserved.
//

import UIKit

class ArcadeViewController: UIViewController {
    

    let arcadeDataCtrl = ArcadeDataCtrl()
    let scoreDataCtrl = ScoreDataCtrl.sharedInstance
    
    var chosenMode : String!
    var chosenModeShadow : String!
    
    var playTimer : Timer!
    var playedTime : Int!
    
    @IBOutlet weak var timerLabel: UILabel!

    @IBOutlet weak var letterLabel: UILabel!

    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    
    @IBAction func quitGameAction(_ sender: UIButton) {
        
        if playedTime < 0 {
            playedTime = 0
        }
        
        scoreDataCtrl.getTime(chosenMode, playedTime)
        
        
    }
    
    
    @IBAction func multipleChoiceButtonAction(_ sender: UIButton) {
        
        playedTime = playedTime + arcadeDataCtrl.checkChoice(chosenMode, sender.currentTitle!)
        timerLabel.text = String(playedTime)
        
        if playedTime <= 0 {
            timerLabel.text = "00"
            playTimer.invalidate()
            button1.isEnabled = false
            button2.isEnabled = false
            button3.isEnabled = false
            button4.isEnabled = false
        }
        else{
        arcadeDataCtrl.randomLetterArray = []
        arcadeDataCtrl.makeQuiz(chosenMode)
        makeQuizView()
        }
    }
    
    
    
    func makeQuizView(){
        
        
        if playedTime > 0{
        switch chosenMode {
        case "1","3":
            letterLabel.text = arcadeDataCtrl.randomConvertedLetter
        case "2","4":
            letterLabel.text = arcadeDataCtrl.randomLetter
        
        default:
            print("Fehler bei Anzeige LetterLabel")
        }
        
        
        button1.setTitle(arcadeDataCtrl.randomLetterArray[0], for: .normal)
        button2.setTitle(arcadeDataCtrl.randomLetterArray[1], for: .normal)
        button3.setTitle(arcadeDataCtrl.randomLetterArray[2], for: .normal)
        button4.setTitle(arcadeDataCtrl.randomLetterArray[3], for: .normal)
        
        print(arcadeDataCtrl.randomLetterArray)
            
        }
        else{
            timerLabel.text = "00"
            playTimer.invalidate()
            button1.isEnabled = false
            button2.isEnabled = false
            button3.isEnabled = false
            button4.isEnabled = false
        }
        
    }
    
    @objc func playTime(_ playTimer : Timer){
        
        
        playedTime = playedTime - Int(playTimer.timeInterval)
        timerLabel.text = String(playedTime)
        
        if playedTime == 0{
            timerLabel.text = "00"
            playTimer.invalidate()
            button1.isEnabled = false
            button2.isEnabled = false
            button3.isEnabled = false
            button4.isEnabled = false
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Arcade")
        // Do any additional setup after loading the view.
        
        //gewählter Spielmodi im ArcadeMenü
        chosenMode = chosenModeShadow
        print(chosenMode!)
        
        let time =  arcadeDataCtrl.setTime(chosenMode)
        
        if time > 0{
            playedTime = time
        } else{
            playedTime = 30
        }

        
        //Timer starten
        playTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ArcadeViewController.playTime(_:)), userInfo: nil, repeats: true)
        
        
        //erstellen und darstellen erster MultipleChoice Frage
        arcadeDataCtrl.makeQuiz(chosenMode)
        makeQuizView()
        
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
