//
//  userListViewController.swift
//  DemoFriendRequest
//
//  Created by Henit Work on 10/04/21.
//

import UIKit
import Firebase
import FirebaseFirestore

class userListViewController: UIViewController {
    
    var users : [String] = []
    let db = Firestore.firestore()
    @IBOutlet weak var mainTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadUsers()
        mainTableView.dataSource = self
        mainTableView.rowHeight = 78
        mainTableView.register(UINib.init(nibName: "UserListCellTableViewCell", bundle: nil), forCellReuseIdentifier: "poolUser")
        
        
        

        // Do any additional setup after loading the view.
    }
    func loadUsers(){
        db.collection("Userlist").addSnapshotListener { (querysnapshot, error) in
            self.users = []
            if error == nil {
                
                let userlist = querysnapshot?.documents
                for doc in userlist!{
                    let data = doc.data()
                    let name = data["Email"] as! String
                    self.users.append(name)
                    self.mainTableView.reloadData()
                }
            }
        }
    }
}


//MARK: - Extention Data Source
extension userListViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "poolUser", for: indexPath) as! UserListCellTableViewCell
        
        DispatchQueue.main.async {
            cell.cellView.layer.cornerRadius = 20
        }
        cell.nameLabel.text = self.users[indexPath.row]
        
        return cell
    }
    
    
}


//MARK: - Extention Delegate




