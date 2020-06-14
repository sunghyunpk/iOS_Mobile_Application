//  RecordTableViewController.swift
//  FinalProject
//  Team member : Sunghyun Park(shpark92@iu.edu), Jae Kwan Kim(jk216@iu.edu), Tae Yoon Choi(choitae@iu.edu)
//  iOS App's name: COVID19 case finder
//  Submission Date: 05/06/2020
//
//  Created by Kim, Jae Kwan on 4/30/20.
//  Copyright © 2020 C323 / Spring 2020. All rights reserved.
//

import UIKit

class RecordTableViewController: UITableViewController {
    
    
        // get app delegate:
    var myAppDelegate : AppDelegate?
    // get reference to model
    var myDataReference : COVID19?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // get app delegate:
        self.myAppDelegate = UIApplication.shared.delegate as? AppDelegate
        // get reference to model
        self.myDataReference = myAppDelegate?.myModel
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let lHowManyRows = self.myDataReference?.country_getter().count{
            return lHowManyRows
        }
        else{
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CovidCell", for: indexPath) as! RecordTableViewCell
        
        if let lModel = self.myDataReference{
            let lCountryArray = lModel.country_getter()
            let lCaseArray = lModel.case_getter()
            
            let lcountry = lCountryArray[indexPath.row]
            let lcase = lCaseArray[indexPath.row]
            
            cell.countryLabel.text! = "Country : \(lcountry)"
            print("in tableView...cekkForRowAt(), Country is: \(String(describing: cell.countryLabel.text))")
            cell.caseLabel.text! = "Toatal Cases #: \(lcase)"
            print("in tableView...cekkForRowAt(), Current Patients is: \(String(describing: cell.caseLabel.text))")
            
//            cell.countryRows(input: lcountry)
//            cell.caseRows(input: lcase)
            
        }

        return cell
    }
    
    override func tableView(_ RecordTableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
