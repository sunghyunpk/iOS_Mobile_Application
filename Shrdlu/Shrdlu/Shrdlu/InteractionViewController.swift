//
//  InteractionViewController.swift
//  Shrdlu
//
//  Created by Park, Sunghyun on 3/10/20.
//  Copyright © 2020 C323 / Spring 2020. All rights reserved.
//

import UIKit

class InteractionViewController: UIViewController{
    
    var myAppDelegate : AppDelegate?
    
    var myShrdlu : Shrdlu?

    var myModel = Shrdlu()
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBAction func sendInput(_ sender: UIButton) {
        textField.resignFirstResponder()
        let sendInput:String = self.textField.text ?? ""
        //textView.text = sendInput
        textView.text += myShrdlu?.oneInteraction(userInput: sendInput) ?? "error"
        if let container = self.tabBarController {
            if let sibling = container.viewControllers {
                if sibling.count > 1 {
                print((sibling[0]))
                    
                    if let tableViewController = sibling[1] as? UITableViewController{
                        if let tableView = tableViewController.view as? UITableView{
                            tableView.reloadData()
                        }
                    }
                }
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.myAppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        self.myShrdlu = myAppDelegate?.shrdlu
        
       
    }


}

