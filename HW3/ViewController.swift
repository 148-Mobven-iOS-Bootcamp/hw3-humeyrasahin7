//
//  ViewController.swift
//  HW3
//
//  Created by Hümeyra Şahin on 27.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var datePicker: UIDatePicker!
    @IBOutlet weak private var showLabel: UILabel!
    
    var date: Date!
    var stringFullDate: String!
    var splitted = [String.SubSequence]()
    var dateString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.date = Date()
    }
    
    //MARK: Action Functions

    @IBAction func buttonTapped(_ sender: UIButton) {
        switch sender.tag{
        case 1:
            showLabel.text = date?.day
        case 2:
            showLabel.text = date?.month
        case 3:
            showLabel.text = date?.year
        case 4:
            showLabel.text = date?.dateAsPrettyString
        default:
            break
        }
        
    }
    
    @IBAction func dateValueChanged(_ sender: UIDatePicker) {
        
        date = sender.date
        showLabel.text = date.splitDate()
        
    }
    
   
    
}

//MARK: Date Extension

extension Date {
    
    func splitDate() -> String {
       let stringFullDate = "\(self)"
       let splitted = stringFullDate.split(separator: " ")
       let dateString = String(splitted[0])
       return dateString
    }
    
    var day: String {
        let split = (self.splitDate()).split(separator: "-")
        let day = String(split[2])
        return day
        
    }
    
    var month: String {
        let split = (splitDate()).split(separator: "-")
        let month = String(split[1])
        return month
    }
    
    var year: String {
        let split = (splitDate()).split(separator: "-")
        let year = String(split[0])
        return year
    }
    
    var dateAsPrettyString: String {
        let split = (splitDate()).split(separator: "-")
        let prettyString = "\(split[2])<>\(split[1])<>\(split[0]) "
        return prettyString
    }
    
    
}
