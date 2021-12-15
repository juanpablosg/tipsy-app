

import UIKit

final class CalculatorViewController: UIViewController {
    
    private var result = 0.0
    private var settingsString = ""

    @IBOutlet private weak var billTextField: UITextField!
    @IBOutlet private weak var zeroPorcentageButton: UIButton!
    @IBOutlet private weak var tenPercentageButton: UIButton!
    @IBOutlet private weak var twentyPercentageButton: UIButton!
    @IBOutlet private weak var splitNumberLabel: UILabel!
    
    @IBAction private func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPorcentageButton.isSelected = false
        tenPercentageButton.isSelected = false
        twentyPercentageButton.isSelected = false
        sender.isSelected = true
    }
    
    @IBAction private func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction private func calculatePressed(_ sender: UIButton) {
        
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


