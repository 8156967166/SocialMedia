//
//  ContinueWithFaceBookViewController.swift
//  SocialMediaAppProject
//
//  Created by Bimal@AppStation on 05/09/22.
//

// Add this to the header of your file, e.g. in ViewController.swift
import FBSDKLoginKit

// Add this to the body
class ContinueWithFaceBookViewController: UIViewController, LoginButtonDelegate {
    var setInfo: [String : AnyObject]!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let token = AccessToken.current,
                !token.isExpired {
                // User is logged in, do work such as go to next view controller.
            let token = token.tokenString
            
            let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields": "email, name"], tokenString: token, version: nil, httpMethod: .get)
            
            request.start { connection, result, error in
                print("result ===> \(result)")
            }
        }
        else {
            let loginButton = FBLoginButton()
            loginButton.center = view.center
            loginButton.delegate = self
            loginButton.permissions = ["public_profile", "email"]
            view.addSubview(loginButton)
        }
        
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        print("User Login")
        let token = result?.token?.tokenString
        
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields": "email, name"], tokenString: token, version: nil, httpMethod: .get)
        
        request.start { connection, result, error in
            print("result ===> \(result)")
            let info = result as! [String : AnyObject]
            print(info["name"] as! String)
            print(info["id"] as! String)
            print(info["email"] as! String)
            self.setInfo = info
//            self.performSegue(withIdentifier: "FaceBookLabelSetViewController", sender: nil)
        }
    }

    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("USer LogOut")
        self.performSegue(withIdentifier: "FaceBookLabelSetViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "FaceBookLabelSetViewController") {
            let vc = segue.destination as! FaceBookLabelSetViewController
            vc.setName = setInfo["name"] as! String
            vc.setId = setInfo["id"] as! String
            vc.setEmail = setInfo["email"] as! String
        }
    }
}
