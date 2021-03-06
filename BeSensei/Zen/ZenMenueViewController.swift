//
//  ZenMenueViewController.swift
//  BeSensei
//
//  Created by Angelina Scheler on 02.06.17.
//  Copyright © 2017 Angelina Scheler. All rights reserved.
//

import UIKit

class ZenMenueViewController: UIViewController  {
    
    
    var selectedMode : String? = nil
    
   
    

    @IBAction func HiraganaToRomajiButton(_ sender: Any) {
        
        selectedMode = "1"

        
    }
    
    
    @IBAction func RomajiToHiraganaButton(_ sender: Any) {
        selectedMode = "2"
      
    }
    
   
    @IBAction func KatakanaToRomajiButton(_ sender: Any) {
        selectedMode = "3"
    }
    
    
    @IBAction func RomajiToKatakanaButton(_ sender: Any) {
        selectedMode = "4"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
 
    
  

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
      

        //mode 1: Japanisches Hiragana wird angezeigt,Lateinischer Buchstabe eingegeben
        if segue.identifier == "mode1"{
            let destVC = segue.destination as! ZenViewController
            if let mode = selectedMode {
                destVC.chosenModeShadow = mode
            }
            else {
                print("fehler")
            }
        }
        
        
        
        //mode 2: Lateinischer Buchstabe wird angezeigt, Japanisches Hiragana eingeben
        if segue.identifier == "mode2"{
            let destVC = segue.destination as! ZenViewController

            if let mode = selectedMode {
                
                destVC.chosenModeShadow = mode
            }
            else {
                print("fehler")
            }

        }
        
        //mode 3: Japanisches Katakana wird angeziegt, Lateinischer Buchstabe eingegeben
        if segue.identifier == "mode3"{
            let destVC = segue.destination as! ZenViewController

            if let mode = selectedMode {
                destVC.chosenModeShadow = mode
            }
            else {
                print("fehler")
            }
        }
        
        
        //mode 4: Lateinischer Buchstabe wird angezeigt und Japanisches Katakana eingegeben
        if segue.identifier == "mode4"{
            let destVC = segue.destination as! ZenViewController

            if let mode = selectedMode {
                destVC.chosenModeShadow = mode
            }
            else {
                print("fehler")
            }
        }
        
        
    }
    

}
