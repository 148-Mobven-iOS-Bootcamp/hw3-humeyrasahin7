//
//  ViewController.swift
//  HW3
//
//  Created by Hümeyra Şahin on 27.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var showLabel: UILabel!
    
    /*
    @IBOutlet weak var selectedDayButton: UIButton!
    @IBOutlet weak var selectedMonthButton: UIButton!
    @IBOutlet weak var selectedYearButton: UIButton!
    @IBOutlet weak var showFormattedButton: UIButton! */
    
    var date: Date!
    
    var stringFullDate: String!
    var splitted = [String.SubSequence]()
    var dateString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        datePicker.date = Date()
    }
    

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
    //    print("date value changed" + date.splitDate())
        showLabel.text = date.splitDate()
        
    }
    
   
    
}

extension Date {
    
    func splitDate() -> String {
       let stringFullDate = "\(self)"
       // print("extension içinde full" + stringFullDate)
       let splitted = stringFullDate.split(separator: " ")
       let dateString = String(splitted[0])
       //print("extention içinde date " + dateString)
       return dateString
    }
    
    var day: String {
        //print("dayin içine girdi")
        let split = (self.splitDate()).split(separator: "-")
        let day = String(split[2])
        //print("extensiion day çalıştı:\(day)")
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
       // return splitDate().replacingOccurrences(of: "-", with: "<>")
        return prettyString
    }
    
}
