//
//  ViewController.swift
//  Events
//
//  Created by ANDREW VARVEL on 31/08/2014.
//  Copyright (c) 2014 Andrew Varvel. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
                            
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var subtitleTextField: UITextField!
    
    @IBAction func addEvent(sender: AnyObject) {
        println(self.childViewControllers.count)
        let navVC = self.childViewControllers.last as UINavigationController
        let tableVC = navVC.childViewControllers.last as EventTableViewController
            tableVC.addNewEvent((titleTextField.text), aSubtitle: (subtitleTextField.text))
        resetUI()
        
    }
    
    func resetUI() {
        titleTextField.text = ""
        subtitleTextField.text = ""
        self.view.endEditing(true)
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
