//
//  PrincipalController.swift
//  Memo-training
//
//  Created by Víctor Agulló on 18/10/19.
//  Copyright © 2019 Eztena. All rights reserved.
//

import UIKit

class PrincipalController: UIViewController {
    
    @IBOutlet weak var nameEntry: UITextField!
    @IBOutlet weak var difficultyEntry: UISlider!
    @IBOutlet weak var levelLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func difficultySlider(_ sender: UISlider) {
        sender.maximumValue = 127
        sender.minimumValue = 0
        let diffValue = Int(sender.value)
        levelLabel.text = "\(diffValue)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is GameController
        {
            let destinyGame = segue.destination as? GameController
            
            let difficultyNum = Int8(difficultyEntry.value)
            let finalName = nameEntry.text ?? "Anon"
            
            destinyGame?.difficulty = difficultyNum
            destinyGame?.name = finalName
        }
    }
    
    @IBAction func gameButton(_ sender: Any) {
        self.performSegue(withIdentifier: "segueGame", sender: self)
    }
}
