
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        thirdView.alpha = 0
        self.thirdView.isHidden = true
    }

    @IBAction func switchViews(_ sender: UISegmentedControl) {
        for (index, view) in [firstView, secondView, thirdView].enumerated() {
            view?.isHidden = index != sender.selectedSegmentIndex
        }
    }

}

