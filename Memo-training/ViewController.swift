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
            
            let bool = randomButton?.isSpringLoaded = false
            
            SwitchButton(randomButton: randomButton!, highlight: (bool != nil))
            
            pattern.append(randomButton!)
            
            sleep(30)
            
            SwitchButton(randomButton: randomButton!, highlight: (bool != nil))
        }
        return pattern
    }
    
    func SwitchButton(randomButton: UIButton, highlight: Bool) -> Bool{
        if randomButton.isFocused {
            randomButton.isSpringLoaded = false
            
            print(randomButton.isSpringLoaded)
            
            return randomButton.isSpringLoaded
        } else{
            randomButton.isSpringLoaded = true
            
            print(randomButton.isSpringLoaded)
            
            return randomButton.isSpringLoaded
        }
    }
    
    func Lose(pattern: [UIButton]) {
        //blue.addTarget(pattern, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        
    }
}
