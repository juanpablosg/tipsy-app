
import UIKit

class ResultsViewController: UIViewController {
    
    var result: String?
    var settings: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel?.text = result
        settingsLabel.text = settings

    }
    
}

