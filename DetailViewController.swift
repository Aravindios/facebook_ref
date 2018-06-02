//
//  DetailViewController.swift
//  Facebook_Login
//
//  Created by Robert Shrestha on 2/19/18.
//  Copyright © 2018 Robert Shrestha. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookShare
import FacebookCore


class DetailViewController: UIViewController {
    let loginManager = LoginManager()

  @IBOutlet var emailLblTxt: UILabel!
    @IBOutlet var nameLblTxt: UILabel!
    @IBOutlet var profileImgView: UIImageView!
    
    var userData = [String:Any]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLblTxt.text = self.userData["name"] as? String ?? ""
        self.emailLblTxt.text = self.userData["email"] as? String ?? ""
        if let imageURL = ((userData["picture"] as? [String: Any])?["data"] as? [String: Any])?["url"] as? String {
            //Download image from imageURL
            let url = URL(string: imageURL)
            
          //  self.profileImgView.kf.setImage(with: url)
            
        }
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutBtnPressed(_ sender: Any) {
        self.loginManager.logOut()
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
