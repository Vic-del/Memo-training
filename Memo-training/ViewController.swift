import UIKit

class DataViewController: UIViewController {
    
    @IBOutlet weak var blue: UIButton!
    @IBOutlet weak var red: UIButton!
    @IBOutlet weak var green: UIButton!
    @IBOutlet weak var black: UIButton!
    
    var buttonsArray:[UIButton] = []
    var pattern:[UIButton] = []
    var userTry:[UIButton] = []
    var difficulty:Int8 = 0
    var delay = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonsArray.append(blue)
        buttonsArray.append(red)
        buttonsArray.append(green)
        buttonsArray.append(black)
        repeat{
            let pattern = shuffle(buttons: buttonsArray)
            
            gamble(pattern: pattern)
        }while !lose(pattern: pattern)
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
            delay += 1.0
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                self.switchButton(randomButton: button)
            }
        }
    }
    
    func switchButton(randomButton: UIButton) {
        randomButton.isHighlighted = true
        randomButton.isHighlighted = false
    }
    
    func lose(pattern: [UIButton]) -> Bool {
        if userTry.count == buttonsArray.count {
            if userTry != buttonsArray{
                print("you won!")
                return true
            }
        }
        difficulty += 1
        print(difficulty)
        return false
    }
    
    @IBAction func blue(_ sender: UIButton) {
        userTry.append(blue)
    }
    
    @IBAction func red(_ sender: UIButton) {
        userTry.append(red)
    }
    
    @IBAction func green(_ sender: UIButton) {
        userTry.append(green)
    }
    
    @IBAction func black(_ sender: UIButton) {
        userTry.append(black)
    }
}
