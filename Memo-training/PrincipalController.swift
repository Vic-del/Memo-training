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
    @IBOutlet weak var difficultyEntry: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is GameController
        {
            let destinyGame = segue.destination as? GameController
            
            let difficultyNum = Int8(difficultyEntry.text!) ?? 0
            let finalName = nameEntry.text ?? "Anon"
            
            destinyGame?.difficulty = difficultyNum
            destinyGame?.name = finalName
        }
    }

    @IBAction func gameButton(_ sender: Any) {
        self.performSegue(withIdentifier: "segueGame", sender: self)
    }
}
