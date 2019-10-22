//
//  GameOverController.swift
//  Memo-training
//
//  Created by Víctor Agulló on 20/10/19.
//  Copyright © 2019 Eztena. All rights reserved.
//

import UIKit

class GameOverController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var score: UILabel!
    var playerName = ""
    var playerScore = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text! = playerName
        score.text! = playerScore
    }
    
    @IBAction func initButton(_ sender: UIButton) {
    }
    
    @IBAction func retryButton(_ sender: UIButton) {
    }
}
