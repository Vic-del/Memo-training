import UIKit

class DataViewController: UIViewController {
    
    @IBOutlet weak var blue: UIButton!
    @IBOutlet weak var red: UIButton!
    @IBOutlet weak var green: UIButton!
    @IBOutlet weak var black: UIButton!
    
    var buttonsArray:[UIButton] = []
    var pattern:[UIButton] = []
    var difficulty:Int8 = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonsArray.append(blue)
        buttonsArray.append(red)
        buttonsArray.append(green)
        buttonsArray.append(black)

        let pattern = Shuffle(buttons: buttonsArray)
        
        Gamble(pattern: pattern)
        
        Lose(pattern: pattern)
    }
    
    func Shuffle(buttons: [UIButton]) -> [UIButton] {
        for _ in 0...difficulty {
            let randomButton = buttonsArray.randomElement()
            pattern.append(randomButton!)
        }
        return pattern
    }
    
    func Gamble(pattern: [UIButton]) {
        
        var seconds = 1.0
        for button in pattern {
            seconds += 1.0
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                self.SwitchButton(randomButton: button)
            }
        }
    }
    
    func SwitchButton(randomButton: UIButton){
        randomButton.isHighlighted = true
        
        randomButton.isHighlighted = false
    }
    
    func Lose(pattern: [UIButton]) {
        blue.
    }
    @IBAction func BlueButtoncoño(_ sender: UIButton) {
        
    }
}
