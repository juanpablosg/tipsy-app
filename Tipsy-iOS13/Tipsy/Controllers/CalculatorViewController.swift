

import UIKit

class CalculatorViewController: UIViewController {
    
    var result = 0.0
    var settingsString = ""

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPorcentageButton: UIButton!
    @IBOutlet weak var tenPercentageButton: UIButton!
    @IBOutlet weak var twentyPercentageButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPorcentageButton.isSelected = false
        tenPercentageButton.isSelected = false
        twentyPercentageButton.isSelected = false
        sender.isSelected = true
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        if let billAmount = Double(billTextField.text!), let numberOfPeople = Double(splitNumberLabel.text!) {
            if zeroPorcentageButton.isSelected == true {
                result = billAmount / numberOfPeople
                settingsString = "Split between \(Int(numberOfPeople)) people, with 0% tip."
            } else if tenPercentageButton.isSelected == true {
                result = billAmount * 1.1  / numberOfPeople
                settingsString = "Split between \(Int(numberOfPeople)) people, with 10% tip."
            } else if twentyPercentageButton.isSelected == true {
                result = billAmount * 1.2  / numberOfPeople
                settingsString = "Split between \(Int(numberOfPeople)) people, with 20% tip."
            } else {
                print("IDK")
            }
        }
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationViewController = segue.destination as! ResultsViewController
            destinationViewController.result = String(format: "%.2f", result)
            destinationViewController.settings = settingsString
        }
    }
    
}


