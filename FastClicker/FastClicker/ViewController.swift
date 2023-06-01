//
//  ViewController.swift
//  FastClicker
//
//  Created by Trim Bislimi on 27.02.23.
//

import UIKit

let gameduration = 15

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var clickButton: UIButton!
    
    @IBOutlet weak var clicksLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    //click zähler
    var clicks = 0 {
        didSet{ //didSet heisst hier. Wenn die Variable clicks veräbdert wird, wird die ausgabe gestartet.
            clicksLabel.text = "Clicks: \(clicks)" //mit function clickButtonAction werden die clicks addiert und hier ausgegeben
        }
    }
    
    //So viel Sek bis das Spiel zu ende ist.
    var time = gameduration {
        didSet{
            timeLabel.text = "Time: \(time)" //mit startButtonAction wird die Zeit definiert und mit countdownTimer runtergezählt
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Nur startButton ist wählbar. Erst wenn startButton gewählt wird clickbutton wählbar.
        startButton.isUserInteractionEnabled = true
        clickButton.isUserInteractionEnabled = false
    }

    @IBAction func startButtonAction(_ sender: Any){
        
        //Startbutton wird deaktiviert und clickbutton kann jetzt genutzt werden
        startButton.isUserInteractionEnabled = false
        clickButton.isUserInteractionEnabled = true
        
        //Timer zeit
        time = gameduration
        
        //Clicks auf 0 zurücksetzen
        clicks = 0
        
        //die funciton countdownTimer() wird gestartet
        countdownTimer()
    }
    
    @IBAction func clickButtonAction(_ sender: Any){//wenn click gedrückt wird, wird  + 1 gerechnet
        clicks = clicks + 1
    }
    
    func countdownTimer(){ //funktion um ein Countdown Timer zu implementieren
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) { // nach einer Verzögerung von 1 Sek wird das gestartet. zum UI aktualisieren.
            
            // wenn die Zeit grösser als 0 ist, wird die zeit um 1 reduziert und countdownTimer() wird neu aufgerufen um den Countdown fortzusetzen.
            // self bezieht sich auf var "variable" in class
            if self.time > 0 {
                self.time = self.time - 1
                self.countdownTimer()
            }
            
            else { //wenn die zeit durch ist wird Game Over auf dem timeLabel angezeigt
        
                self.timeLabel.text = "Game Over"
                
                //click button wird deaktiviert und start wird wieder aktiviert um das spiel von neu zu starten.
                self.startButton.isUserInteractionEnabled = true
                self.clickButton.isUserInteractionEnabled = false
            }
        }
    }
    
}

