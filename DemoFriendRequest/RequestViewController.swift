//
//  RequestViewController.swift
//  DemoFriendRequest
//
//  Created by Henit Work on 10/04/21.
//

import UIKit
import Firebase
import FirebaseFirestore
import UserNotifications

class RequestViewController: UIViewController {
    
    @IBOutlet weak var numberValue: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var submitButton: UIButton!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        submitButton.layer.cornerRadius = 20
        
        

    }
    
    @IBAction func submitButtonHit(_ sender: UIButton) {
        self.performSegue(withIdentifier: "todetails", sender: self)
    }
    

    

}



