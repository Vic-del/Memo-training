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
    
    // Array de nombres
    var fillName = ["Crack", "Titán", "Mastodonte", "Figura", "Jefe", "Campeón", "Semental", "Diplodocus", "Máquina"]
    
    // Nombre del jugador
    var playerName = ""
    
    // Puntuación
    var playerScore = 0
    
    // Se sustituyen los valores de puntuación y usuario por los recibidos de la pantalla anterior
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text! = playerName
        score.text! = String(playerScore)
        anonymizer()
    }
    
    // Si el jugador no ha metido el nombre, se le asigna uno por defecto
    func anonymizer(){
        if name.text! == ""
        {
            name.text! = fillName.randomElement()!
        }
        
    }
    
    /*
    Botón para volver al inicio de la app, dado que no se necesita ninguna condición especial
    o ningún valor que pasar a la pantalla principal, se usa el segue del storyboard
     */
    @IBAction func initButton(_ sender: UIButton) {
    }
}
