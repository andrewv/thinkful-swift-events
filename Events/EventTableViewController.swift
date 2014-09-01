//
//  EventTableViewController.swift
//  Events
//
//  Created by ANDREW VARVEL on 31/08/2014.
//  Copyright (c) 2014 Andrew Varvel. All rights reserved.
//

import UIKit
import Realm


class EventTableViewController: UITableViewController {
    
    var array = RLMArray(objectClassName: Event.className())

  
    
    func addNewEvent(aTitle:String, aSubtitle:String) {
        let newEvent:Event = Event()
        array = Event.allObjects().arraySortedByProperty("position", ascending: true)
        newEvent.eventTitle = aTitle
        newEvent.eventSubtitle = aSubtitle
        newEvent.position = (Int(array.count))+1
        
        //default realm
        let realm = RLMRealm.defaultRealm()

        
        //write to realm
        realm.beginWriteTransaction()
        realm.addObject(newEvent)
        realm.commitWriteTransaction()
        println("the array has \(array.count) objects")

        reloadData()
        
    }
    
    func reloadData() {
        array = Event.allObjects().arraySortedByProperty("position", ascending: true)
        println("tableview was reloaded")
        tableView.reloadData()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        reloadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return Int(array.count)
    }

    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell? {
        let cell = tableView!.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell
        let object = array[UInt(indexPath!.row)] as Event
        cell.textLabel.text = object.eventTitle
        cell.detailTextLabel.text = object.eventSubtitle
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            let realm = RLMRealm.defaultRealm()
            realm.beginWriteTransaction()
            realm.deleteObject(array[UInt(indexPath.row)] as RLMObject)
            realm.commitWriteTransaction()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
  

    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {
        let realm = RLMRealm.defaultRealm()
        realm.beginWriteTransaction()
        var object = array.objectAtIndex(UInt(fromIndexPath.row)) as Event
        object.position = Int(toIndexPath.row)
        realm.commitWriteTransaction()
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
