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
        let dataVC = self.childViewControllers.last as OutputViewController
        dataVC.addNewEvent((titleTextField.text), subtitle: (subtitleTextField.text))
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


class OutputViewController:UIViewController {
    
    @IBOutlet weak var outputTextView: UITextView!
    
    func addNewEvent(title:String, subtitle:String) {
        var newTitle = title
        var newSubtitle = subtitle
        outputTextView.text = outputTextView.text.stringByAppendingFormat("\n%@", newTitle)
        outputTextView.text = outputTextView.text.stringByAppendingFormat("\n%@", newSubtitle)
        outputTextView.text = outputTextView.text.stringByAppendingFormat("\n%@", "")


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
