//
//  ExistingContactViewController.swift
//  Program3
//
//  Created by Aaron Rosenberger on 2/29/16.
//  Copyright © 2016 Aaron Rosenberger. All rights reserved.
//

import UIKit

class ExistingContactViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var navbar: UINavigationItem!
    
    var newName = ""
    var newPhone = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = newName
        phone.text = newPhone
        phone.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
