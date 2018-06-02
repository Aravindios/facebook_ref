//
//  ViewController.swift
//  refFB
//
//  Created by apple on 4/11/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore
import FacebookShare
import Crashlytics



class ViewController: UIViewController {

    let loginManager = LoginManager()
    
    
    @IBOutlet weak var fblogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func fbaction(_ sender: Any){
         Crashlytics.sharedInstance().crash()
        loginManager.logIn(readPermissions: [.email,.publicProfile], viewController: self) { (loginResult) in
            print(loginResult)
            
            switch loginResult{
            case .cancelled:
                print("User cancalled Login.")
            case .failed(let error):
                print(error.localizedDescription)
            case .success(grantedPermissions: let granted, declinedPermissions:let declined, token: let token):
                print(token.userId as Any)
                print(declined)
                print(granted)
                let req = GraphRequest(graphPath: "me", parameters: ["fields":"email,name,picture.width(100).height(100)"], accessToken: token, httpMethod: GraphRequestHTTPMethod(rawValue: "GET")!, apiVersion: .defaultVersion)
                req.start({ (response, value) in
                    switch value{
                    case .success(let value):
                        print(value.dictionaryValue as Any)
                        let data = value.dictionaryValue ?? [:]
                        print(data["name"] ?? "")
                        print(data["email"] ?? "")
                        print(data["picture"] ?? [:])
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetaiViewController") as! DetailViewController
                        vc.userData = data
                        self.present(vc, animated: true, completion: nil)
                    case .failed(let error):
                        print(error)
                    }
                })
                
            }
        }
        
    }
    
    
        // working
   // {
//
//
//        FBSDKAccessToken.setCurrent(nil)
//
//
//
//
//
//        if(FBSDKAccessToken.current() != nil) {
//            FBSDKAccessToken.setCurrent(nil)
//            // self.returnUserData()
//
//        } else {
//            FBSDKAccessToken.setCurrent(nil)
//            let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
//            fbLoginManager.loginBehavior = FBSDKLoginBehavior.web
//
//            fbLoginManager.logIn(withReadPermissions: ["public_profile", "email", "user_friends"], from: self, handler:{ (result, error) -> Void in
//                //            fbLoginManager .logIn(withReadPermissions: ["public_profile", "email", "user_friends"], handler: { (result, error) -> Void in
//                print(error)
//                if (error != nil){
//                    //self.returnUserData()
//
//
//                }
//                else if (result?.isCancelled)! {
//                    //handle cancellation
//
//
//
//                }
//                else
//                {
//                    let fbloginresult : FBSDKLoginManagerLoginResult = result!
//                    if(fbloginresult.grantedPermissions.contains("email"))
//                    {
//                        //          self.returnUserData()
//                    }
//                }
//            })
//
//
//            //            fbLoginManager.logInWithReadPermissions(["email"],fromViewController: self) { (result:FBSDKLoginManagerLoginResult!, fberror) -> Void in
//            //
//            //                print("Facebook login failed. Error \(fberror)")
//            //            }
//        }
//    }
    
    
    //working
    
    
    
    
//    func loginWithFB(){
//        print("Login With facebook")
//
//
//
//        var urlstring:String = "\(signInAPIUrl)fbSignup/regid/5764/first_name/\(self.appDelegate.fbFirstName!)/last_name/\(self.appDelegate.fbLastName!)/mobile/null/country_code/+91/city/madurai/email/\(self.appDelegate.fbEmail!)/fb_id/\(self.appDelegate.fbID!)"
//
//        urlstring = urlstring.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)!
//        print(urlstring)
//
//        self.callSiginAPI(url: "\(urlstring)")
//
//
//
//    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

