//
//  TripTableViewController.swift
//  Traveler2
//
//  Created by Ash Mahein on 2/11/18.
//  Copyright © 2018 Ash Mahein. All rights reserved.
//

import UIKit

class TripTableViewController: UITableViewController {
    
    var trips = [Trip]()
    var selectedRow: Int = 0
    
    let dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        initializeTrips(tripArray: trips)
    }
    
    func initializeTrips(tripArray: [Trip]){
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        let firstTrip = Trip(destinationName: "Huntington Beach", startDate: dateFormatter.date(from: "01/17/2018")!, endDate: dateFormatter.date(from: "01/20/2018")!, imageFileName: "Huntington-Beach.jpg")
        let secondTrip = Trip(destinationName: "Paris", startDate: dateFormatter.date(from: "02/14/2018")!, endDate: dateFormatter.date(from: "02/20/2018")!, imageFileName: "paris.jpg")
        let thirdTrip = Trip(destinationName: "United Kingdom", startDate: dateFormatter.date(from: "10/01/2018")!, endDate: dateFormatter.date(from: "12/01/2018")!, imageFileName: "")
        
        trips.append(firstTrip)
        trips.append(secondTrip)
        trips.append(thirdTrip)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return trips.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        performSegue(withIdentifier: "toDetails", sender: nil)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "trip1Cell", for: indexPath) as! TripCell
        cell.tripName.text = trips[indexPath.row].destinationName
        cell.dates.text = dateFormatter.string(from: trips[indexPath.row].startDate) + "-" + dateFormatter.string(from: trips[indexPath.row].endDate)
        if(trips[indexPath.row].imageFileName == ""){
            cell.imageView?.image = UIImage(named: "ImageNotFound.JPEG")
        }
        else{
            cell.imageView?.image = UIImage(named: trips[indexPath.row].imageFileName!)
        }
        
        return cell
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            trips.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "toDetails"){
            let detailVC = segue.destination as! ViewController
            
            detailVC.destinationName = trips[selectedRow].destinationName
            detailVC.start = dateFormatter.string(from: trips[selectedRow].startDate)
            detailVC.end = dateFormatter.string(from: trips[selectedRow].endDate)
            
            detailVC.image = trips[selectedRow].imageFileName!
        }
    }
    @IBAction func unwindFromAdd(segue: UIStoryboardSegue){
        let addVC = segue.source as! AddTripViewController
        if(addVC.tripCheck){
            let newTripToAdd = addVC.newTrip
            trips.append(newTripToAdd!)
            self.tableView.reloadData()
        }
    }
}
