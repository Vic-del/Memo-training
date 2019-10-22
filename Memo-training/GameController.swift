//
//  GameController.swift
//  Memo-training
//
//  Created by Víctor Agulló on 18/10/19.
//  Copyright © 2019 Eztena. All rights reserved.
//

import UIKit

class GameController: UIViewController {
    
    @IBOutlet weak var blue: UIButton!
    @IBOutlet weak var red: UIButton!
    @IBOutlet weak var green: UIButton!
    @IBOutlet weak var black: UIButton!
    
    var buttonsArray:[UIButton] = []
    var pattern:[UIButton] = []
    var userTry:[UIButton] = []
    var difficulty:Int8 = 0
    var delay = 1.0
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
    }
    
    func startGame() {
        buttonsArray.append(blue)
        buttonsArray.append(red)
        buttonsArray.append(green)
        buttonsArray.append(black)
        
        let pattern = shuffle(buttons: buttonsArray)
        gamble(pattern: pattern)
    }
    
    func shuffle(buttons: [UIButton]) -> [UIButton] {
        for _ in 0...difficulty {
            let randomButton = buttonsArray.randomElement()
            pattern.append(randomButton!)
        }
        return pattern
    }
    
    func gamble(pattern: [UIButton]) {
        for button in pattern {
            delay += 0.5
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                self.switchButton(randomButton: button)
            }
        }
    }
    
    func switchButton(randomButton: UIButton) {
        randomButton.isHighlighted = true
        randomButton.isHighlighted = false
    }
    
    func lose(pattern: [UIButton]){
        if userTry.count == pattern.count{
            if userTry != pattern{
                performSegue(withIdentifier: "segueGameOver", sender: self)
            } else{
                difficulty = difficulty + 1
                print(difficulty)
                self.userTry = []
                startGame()
            }
        }
    }
    
    @IBAction func blue(_ sender: UIButton) {
        userTry.append(blue)
        lose(pattern: pattern)
    }
    
    @IBAction func red(_ sender: UIButton) {
        userTry.append(red)
        lose(pattern: pattern)
    }
    
    @IBAction func green(_ sender: UIButton) {
        userTry.append(green)
        lose(pattern: pattern)
    }
    
    @IBAction func black(_ sender: UIButton) {
        userTry.append(black)
        lose(pattern: pattern)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is GameOverController
        {
            let destinyGameOver = segue.destination as? GameOverController
            print("prepare", difficulty)
            let difficultyString = String(difficulty)
            let notnilname = name
            
            destinyGameOver?.playerName = notnilname
            destinyGameOver?.playerScore = difficultyString
        }
    }
}
