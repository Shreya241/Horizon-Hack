//
//  UserListCellTableViewCell.swift
//  DemoFriendRequest
//
//  Created by Henit Work on 10/04/21.
//

import UIKit
import Firebase
import FirebaseFirestore

class UserListCellTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var requestButton: UIButton!
    @IBOutlet weak var cellView: UIView!
    
    var db = Firestore.firestore()
    override func awakeFromNib() {
        super.awakeFromNib()
        DispatchQueue.main.async {
            self.cellView.layer.cornerRadius = 20
        }
    }
    
    @IBAction func putRequest(_ sender: UIButton) {
        
        db.collection(nameLabel.text!).document("requestList").collection("request").addDocument(data: ["Email" : (Auth.auth().currentUser?.email)!])
        
    }
    


    
}
