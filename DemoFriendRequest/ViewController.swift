//
//  ViewController.swift
//  DemoFriendRequest
//
//  Created by Henit Work on 09/04/21.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var submitButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.layer.cornerRadius = 15
        
       
    }
    @IBAction func submitButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toFinal", sender: self)
    }
    

}

