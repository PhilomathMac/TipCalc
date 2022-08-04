//
//  HomeViewController.swift
//  TipCalc
//
//  Created by McKenzie Macdonald on 8/4/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var tipSegmentedControl: UISegmentedControl!
    @IBOutlet weak var splitLabel: UILabel!
    
    @IBOutlet weak var splitStepper: UIStepper!
    @IBOutlet weak var roundingToggle: UISwitch!
    
    let calcBrain = CalcBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateButtonClicked(_ sender: Any) {
        
    }
    
}

