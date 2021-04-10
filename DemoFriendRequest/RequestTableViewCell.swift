//
//  RequestTableViewCell.swift
//  DemoFriendRequest
//
//  Created by Henit Work on 10/04/21.
//

import UIKit
import Firebase
import FirebaseFirestore

class RequestTableViewCell: UITableViewCell {
    
    @IBOutlet weak var requesterName: UILabel!
    var db = Firestore.firestore()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func accepted(_ sender: UIButton) {
        db.collection((Auth.auth().currentUser?.email)!).document("FriendList").collection((requesterName.text)!).addDocument(data: ["Email" : (requesterName.text)!])
    }
    
    @IBAction func rejected(_ sender: UIButton) {
    }
    
}
