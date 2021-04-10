//
//  SignHandlerViewController.swift
//  DemoFriendRequest
//
//  Created by Henit Work on 09/04/21.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignHandlerViewController: UIViewController {

    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var activityiIndicator: UIActivityIndicatorView!
    @IBOutlet weak var SignUpPassword: UITextField!
    @IBOutlet weak var signUpName: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    @IBOutlet weak var loginName: UITextField!
    let db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
        activityiIndicator.isHidden = true
        signUpName.layer.cornerRadius = 20
        SignUpPassword.layer.cornerRadius = 20
        loginName.layer.cornerRadius = 20
        loginPassword.layer.cornerRadius = 20
        signUpButton.layer.cornerRadius = 15
        loginButton.layer.cornerRadius = 15
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtoNHit(_ sender: UIButton) {
        activityiIndicator.isHidden = false
        activityiIndicator.startAnimating()
        Auth.auth().signIn(withEmail: loginName.text!, password:loginPassword.text!) { (result, error) in
            self.activityiIndicator.stopAnimating()
            self.performSegue(withIdentifier: "tofeed", sender: self)
        }
    }
    
    @IBAction func signUpHit(_ sender: UIButton) {
        activityiIndicator.isHidden = false
        activityiIndicator.startAnimating()
        
        Auth.auth().createUser(withEmail: signUpName.text!, password: SignUpPassword.text!) { (result, error) in
            self.activityiIndicator.stopAnimating()
            self.db.collection("Userlist").addDocument(data: ["Email" : self.signUpName.text!])
            self.db.collection(self.signUpName.text!).document("Request")
            self.db.collection(self.signUpName.text!).document("FriendList")
            
            self.performSegue(withIdentifier: "tofeed", sender: self)
        }
    }
    

}
