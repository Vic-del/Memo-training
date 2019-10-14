import UIKit

class DataViewController: UIViewController {
    
    @IBOutlet weak var blue: UIButton!
    @IBOutlet weak var red: UIButton!
    @IBOutlet weak var green: UIButton!
    @IBOutlet weak var black: UIButton!
    
    var buttonsArray:[UIButton] = []
    var pattern:[UIButton] = []
    var difficulty:Int8 = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonsArray.append(blue)
        buttonsArray.append(red)
        buttonsArray.append(green)
        buttonsArray.append(black)

        let pattern = Gamble(buttons: buttonsArray)
        
        Lose(pattern: pattern)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func Gamble(buttons: [UIButton]) -> [UIButton] {
        for _ in 0...difficulty {
            let randomButton = buttonsArray.randomElement()
            
            SwitchButton(randomButton: randomButton!)
            
            pattern.append(randomButton!)
            
            SwitchButton(randomButton: randomButton!)
        }
        return pattern
    }
    
    func SwitchButton(randomButton: UIButton) {
        if randomButton.isHighlighted {
            randomButton.isHighlighted = false
        } else{
            randomButton.isHighlighted = true
        }
    }
    
    func Lose(pattern: [UIButton]) {
        /*if pattern {
         print("score", difficulty)
         }*/
    }
}
