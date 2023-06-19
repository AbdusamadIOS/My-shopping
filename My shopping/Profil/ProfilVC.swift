//
//  ProfilVC.swift
//  My shopping
//
//  Created by Abdusamad Mamasoliyev on 23/05/23.
//

import UIKit

class ProfilVC: UIViewController {

    var sozlamalar: [Sozlamalar] = [
        Sozlamalar(sozlamaNomi:"Buyurtmalar", sozlamaImage: UIImage(systemName: "basket")!),
        Sozlamalar(sozlamaNomi: "Saralanganlar", sozlamaImage:  UIImage(systemName: "star")!),
        Sozlamalar(sozlamaNomi: "Xabarnomalar", sozlamaImage: UIImage(systemName: "bell.circle")!),
        Sozlamalar(sozlamaNomi: "Online chat", sozlamaImage: UIImage(systemName: "message")!),
        Sozlamalar(sozlamaNomi: "Ilova tili", sozlamaImage: UIImage(systemName: "globe")!),
        Sozlamalar(sozlamaNomi: "My shopping shartlari", sozlamaImage: UIImage(systemName: "doc.append.rtl")!),
        Sozlamalar(sozlamaNomi: "My shop o'zi nima", sozlamaImage: UIImage(systemName: "questionmark.app")!),
        Sozlamalar(sozlamaNomi: "Biz bilan bog'lanish", sozlamaImage: UIImage(systemName: "phone.circle")!),
    ]
    
    @IBOutlet weak var conteneirView: UIView!
    @IBOutlet weak var userPhotoImage: UIImageView!
    @IBOutlet weak var userFISHLbl: UILabel!
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
   
    var userdata: UserDataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
        
        userPhotoImage.layer.cornerRadius = 30
        conteneirView.layer.cornerRadius = 15
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let userdata {
            
            userPhotoImage.image = userdata.image
            userFISHLbl.text = userdata.FISh
            userEmailLbl.text = userdata.email
        }
        
        
    }
    @IBAction func btn(_ sender: UIButton) {
        
        let vc = EditProfile(nibName: "EditProfile", bundle: nil)
        
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        
        vc.closure =  { userdata in
            self.userdata = userdata
        }
        
        self.present(vc, animated: true)
    }

}

extension ProfilVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sozlamalar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as! ProfileCell
       
        cell.sozlamaImg.image = sozlamalar[indexPath.row].sozlamaImage
        cell.sozlamaNomiLbl.text = sozlamalar[indexPath.row].sozlamaNomi
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }
}
