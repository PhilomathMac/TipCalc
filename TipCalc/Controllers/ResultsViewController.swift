//
//  ResultsViewController.swift
//  TipCalc
//
//  Created by McKenzie Macdonald on 8/4/22.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    let totalPerPerson: String
    let settingsString: String
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func recalculateButtonClicked(_ sender: Any) {
        
    }
    
}
