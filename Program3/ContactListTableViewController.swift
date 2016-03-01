//
//  ContactListTableViewController.swift
//  Program3
//
//  Created by Aaron Rosenberger on 2/29/16.
//  Copyright © 2016 Aaron Rosenberger. All rights reserved.
//

import UIKit

class Contact {
    var name: String
    var phone: String
    init(name: String, phone: String) {
        self.name = name
        self.phone = phone
    }
}

class ContactListTableViewController: UITableViewController {
    
    var contacts = [Contact]()
    var current = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return contacts.count
        case 1:
            return 1
        default:
            return 0
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            // Add new contact
            let addContactCell = tableView.dequeueReusableCellWithIdentifier("addContact", forIndexPath: indexPath)
            addContactCell.textLabel!.text! = "Add new contact"
            return addContactCell
        } else if indexPath.section == 0 {
            // Contacts list
            let contactCell = tableView.dequeueReusableCellWithIdentifier("contact", forIndexPath: indexPath)
            contactCell.textLabel!.text! = contacts[indexPath.row].name
            contactCell.detailTextLabel!.text! = contacts[indexPath.row].phone
            return contactCell
        }
        return UITableViewCell()
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        current = indexPath.row
        return indexPath
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if indexPath.section == 1 {
            performSegueWithIdentifier("addContactSegue", sender: self)
        } else if indexPath.section == 0 {
            performSegueWithIdentifier("existingContactSegue", sender: self)
        }
    }
    
    @IBAction func cancelNew(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func doneNew(segue: UIStoryboardSegue) {
        let source = segue.sourceViewController as! AddNewContactViewController
        let newName = source.name.text
        let newPhone = source.phone.text
        if newName != nil && newPhone != nil && newName != "" && newPhone != "" {
            let newContact = Contact(name: newName!, phone: newPhone!)
            contacts.append(newContact)
        } else {
            print("New contact not added because of empty fields.")
        }
        tableView.reloadData()
    }
    
    @IBAction func cancelExisting(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func doneExisting(segue: UIStoryboardSegue) {
        let source = segue.sourceViewController as! ExistingContactViewController
        let newName = source.name.text
        let newPhone = source.phone.text
        if newName != nil && newPhone != nil && newName != "" && newPhone != "" {
            contacts[current].phone = newPhone!
        } else {
            print("New contact not modified because of empty fields.")
        }
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "existingContactSegue" {
            let dest = segue.destinationViewController as! ExistingContactViewController
            dest.newName = contacts[current].name
            dest.newPhone = contacts[current].phone
        }
    }

}
