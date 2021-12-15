
import UIKit

final class ResultsViewController: UIViewController {
    
    var result: String?
    var settings: String?
    
    @IBOutlet private weak var totalLabel: UILabel!
    @IBOutlet private weak var settingsLabel: UILabel!
    
    @IBAction private func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel?.text = result
        settingsLabel.text = settings

    }
    
}

