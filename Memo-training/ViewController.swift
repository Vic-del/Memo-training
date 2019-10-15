import UIKit

class DataViewController: UIViewController {
    
    @IBOutlet weak var blue: UIButton!
    @IBOutlet weak var red: UIButton!
    @IBOutlet weak var green: UIButton!
    @IBOutlet weak var black: UIButton!
    
    var buttonsArray:[UIButton] = []
    var pattern:[UIButton] = []
    var difficulty:Int8 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonsArray.append(blue)
        buttonsArray.append(red)
        buttonsArray.append(green)
        buttonsArray.append(black)

        let pattern = Gamble(buttons: buttonsArray)
        
        Lose(pattern: pattern)
    }
    
    func Gamble(buttons: [UIButton]) -> [UIButton] {
        for _ in 0...difficulty {
            let randomButton = buttonsArray.randomElement()
            
            let bool = randomButton?.isHighlighted = false
            
            SwitchButton(randomButton: randomButton!, highlight: (bool != nil))
            
            pattern.append(randomButton!)
                        
            SwitchButton(randomButton: randomButton!, highlight: (bool != nil))
        }
        return pattern
    }
    
    func SwitchButton(randomButton: UIButton, highlight: Bool) -> Bool{
        if randomButton.isHighlighted {
            randomButton.isHighlighted = false
            
            print(randomButton.isHighlighted)
            
            return randomButton.isHighlighted
        } else{
            randomButton.isHighlighted = true
            
            print(randomButton.isHighlighted)
            
            return randomButton.isHighlighted
        }
    }
    
    func Lose(pattern: [UIButton]) {
        //blue.addTarget(pattern, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        
    }
}
