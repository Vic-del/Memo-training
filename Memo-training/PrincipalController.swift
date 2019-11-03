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
    
    // Valor de dificultad
    var diffValue = 1
    
    // Carga los límites del slider
    override func viewDidLoad() {
        super.viewDidLoad()
        difficultyEntry.maximumValue = 20
        difficultyEntry.minimumValue = 1
    }
    
    /*
     Creación del slider de dificultad y preparación del valor a mandar.
     La preferencia de un slider sobre otras formas de mostrar visualmente
     la dificultad viene dada por su sencillez a la hora de que el usuario
     lo maneje.
     */
    @IBAction func difficultySlider(_ sender: UISlider) {
        diffValue = Int(sender.value)
        levelLabel.text = "\(diffValue)"
    }
    
    /*
     Función que permite el paso de variables y constantes entre pantallas, en este
     caso se quieren pasar el nombre transmitido desde la vista Principal y la puntuación
     obtenida tras perder en esta vista hacia GameOver.
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        /*
         El prepare resulta el método más sencillo para pasar datos entre pantallas, crea
         una variable que tiene acceso a los atributos de la pantalla importada para darles
         otros valores.
         */
        if segue.destination is GameController
        {
            let destinyGame = segue.destination as? GameController
            
            let finalName = nameEntry.text
            
            destinyGame?.difficulty = diffValue
            destinyGame?.name = finalName!
        }
    }
    
    // Botón para empezar el juego y mandar todos los valores
    @IBAction func gameButton(_ sender: Any) {
        self.performSegue(withIdentifier: "segueGame", sender: self)
    }
}
