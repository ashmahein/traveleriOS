//
//  AddTripViewController.swift
//  Traveler2
//
//  Created by Ash Mahein on 2/1/18.
//  Copyright © 2018 Ash Mahein. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController, UITextFieldDelegate {
    
    var newTrip : Trip!
    var tripCheck: Bool = false
    
    @IBOutlet weak var errorMessage: UILabel!
    
    @IBOutlet weak var destinationText: UITextField!
    @IBOutlet weak var startDateText: UITextField!
    @IBOutlet weak var endDateText: UITextField!
    
    let dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Add Trip"
        navigationItem.prompt = "Traveler"
        
        destinationText.delegate = self
        startDateText.delegate = self
        endDateText.delegate = self
        errorMessage.text = ""

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    @IBAction func cancelTripAdd(_ sender: UIButton) {
        tripCheck = false
        performSegue(withIdentifier: "unwindFromAdd", sender: self)
    }
    
    @IBAction func saveNewTrip(_ sender: UIButton) {
        
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        if destinationText.text == ""{
            errorMessage.text = "Missing Destination"
            return
        }
        else if (dateFormatter.date(from: startDateText.text!) == nil) {
            errorMessage.text = "Invalid Start Date"
            return
        }
        else if (dateFormatter.date(from: endDateText.text!) == nil){
            errorMessage.text = "Invalid End Date"
            return
        }
        else{
            errorMessage.text = ""
        }
        
        newTrip = Trip(destinationName: destinationText.text!, startDate: dateFormatter.date(from: startDateText.text!)!, endDate: dateFormatter.date(from: endDateText.text!)!, imageFileName: "")

        //After new trip is saved we want to clear the text fields for a new entry.
        destinationText.text = ""
        startDateText.text = ""
        endDateText.text = ""
        
        tripCheck = true
        performSegue(withIdentifier: "unwindFromAdd", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
