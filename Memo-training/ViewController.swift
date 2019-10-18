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
            print("you lose!")
            } else{
                difficulty + 1
                print(difficulty, pattern, userTry)
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
}
