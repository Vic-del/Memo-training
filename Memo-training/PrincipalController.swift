//
//  PrincipalController.swift
//  Memo-training
//
//  Created by Víctor Agulló on 18/10/19.
//  Copyright © 2019 Eztena. All rights reserved.
//

import UIKit

class PrincipalController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBOutlet weak var difficultyEntry: UITextField!
    
    @IBAction func gameButton(_ sender: Any) {
        self.performSegue(withIdentifier: "segueGame", sender: self)
    }
}
