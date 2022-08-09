//
//  CalcBrain.swift
//  TipCalc
//
//  Created by McKenzie Macdonald on 8/4/22.
//

import Foundation

struct CalcBrain {
    var billTotal: Double? = nil
    var tipPercent = 0.15
    var splitBetweenNum = 1
    var roundedUp = true
    var totalPerPersonString = ""
    
    mutating func setTipPercent(to tip: Double) {
        self.tipPercent = tip
    }
    
    mutating func setSplitNum(to numPeople: Int) {
        self.splitBetweenNum = numPeople
    }
    
    mutating func setRounding(to isRounded: Bool) {
        self.roundedUp = isRounded
    }
    
    mutating func calculateTotalPerPerson(for billTotal: Double) {
        self.billTotal = billTotal
        guard self.billTotal != nil else {
            print("Error: Unexpectadly found nil when calculate button pressed")
            return
        }
        
        let billPlusTip = (self.billTotal! * tipPercent) + self.billTotal!
        let billPerPerson = billPlusTip / Double(splitBetweenNum)
        totalPerPersonString = String(format: "$%.2f", billPerPerson)
    }
    
}
