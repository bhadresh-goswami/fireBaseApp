//
//  ViewController.swift
//  fireBaseApp
//
//  Created by Mac on 19/02/19.
//  Copyright © 2019 tops. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {

    
    @IBOutlet var txtUserName: UITextField!
    @IBOutlet var txtUserPassword: UITextField!
    var ref:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        var refHandle = ref.observe(DataEventType.value, with: { (snapshot) in
            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            print(postDict)
        })
    }

    @IBAction func tapToSaveData(_ sender: UIButton) {
        ref.child("Harsha").childByAutoId().setValue(["name":txtUserName.text!,"password":txtUserPassword.text!])
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

