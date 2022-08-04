//
//  HomeViewController.swift
//  TipCalc
//
//  Created by McKenzie Macdonald on 8/4/22.
//

import UIKit

class HomeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var tipSegmentedControl: UISegmentedControl!
    @IBOutlet weak var splitLabel: UILabel!
    
    @IBOutlet weak var roundingToggle: UISwitch!
    
    var calcBrain = CalcBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        splitLabel.text = "1"
        billTextField.delegate = self
    }

    @IBAction func calculateButtonClicked(_ sender: UIButton) {
        billTextField.endEditing(true)
        // Validate that bill total was entered
        guard let billString = billTextField.text else { return }
        // Clean user text
        let cleanedBillString = billString.filter({ "1234567890.".contains($0) })
        guard cleanedBillString != "" else { return }
        guard let bill = Double(cleanedBillString) else { return }
        
        // Calculate bill total
        calcBrain.calculateTotalPerPerson(for: bill)
        
        // Segue to results screen
        performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        let numPeople = Int(sender.value)
        splitLabel.text = "\(numPeople)"
        calcBrain.setSplitNum(to: numPeople)
    }
    
    @IBAction func tipSelectionChanged(_ sender: UISegmentedControl) {
        billTextField.endEditing(true)
        let tip: Double
        switch sender.selectedSegmentIndex {
        case 0:
            tip = 0.10
        case 1:
            tip = 0.15
        case 2:
            tip = 0.20
        case 3:
            tip = 0.25
        default:
            print("Error")
            tip = 200.0
        }
        calcBrain.setTipPercent(to: tip)
    }
    
    @IBAction func roundingToggleChanged(_ sender: UISwitch) {
        billTextField.endEditing(true)
        calcBrain.setRounding(to: sender.isOn)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalPerPerson = calcBrain.totalPerPersonString
            
            let tipString = String(format: "%.0f", calcBrain.tipPercent * 100)
            destinationVC.settingsString = "Split between \(calcBrain.splitBetweenNum) people with a \(tipString)% tip"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}

