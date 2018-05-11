//
//  ViewController.swift
//  Traveler2
//
//  Created by Ash Mahein on 1/18/18.
//  Copyright © 2018 Ash Mahein. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    let dateFormatter = DateFormatter()
    
    var trips = [Trip]()
    var tripIndex: Int  = 0
    
    var destinationName:String = ""
    var start: String = ""
    var end: String = ""
    var image: String = ""
    
    @IBOutlet weak var Destination: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var endDate: UILabel!
    @IBOutlet weak var tripImage: UIImageView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Trip Details"
        navigationItem.prompt = "Traveler"
        
        
        Destination.text = "Destination: \(destinationName)"
        startDate.text = "Start Date: " + start
        endDate.text = "End Date: " + end
        tripImage.image = UIImage(named: image)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

