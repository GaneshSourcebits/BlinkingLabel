//
//  MainViewController.swift
//  BlinkingLabel
//
//  Created by Ganesh Kumar on 03/09/18.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import TwitterKit
import GoogleSignIn

public class MainViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {

    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.green
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self

        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 30))
        label.text = "Main View"
        label.textColor = UIColor.red
        view.addSubview(label)
        
        let loginWithFB = UIButton(frame: CGRect(x: 50, y: 300, width: 200, height: 30))
        loginWithFB.setTitle("Login With FB", for: .normal)
        loginWithFB.setTitleColor(UIColor.red, for: .normal)
        loginWithFB.addTarget(self, action: #selector(LoginWithFB), for: .touchUpInside)
        view.addSubview(loginWithFB)
        
        let loginWithTW = UIButton(frame: CGRect(x: 50, y: 400, width: 300, height: 30))
        loginWithTW.setTitle("Login With Twitter", for: .normal)
        loginWithTW.setTitleColor(UIColor.red, for: .normal)
        loginWithTW.addTarget(self, action: #selector(LoginWithTwitter), for: .touchUpInside)
        view.addSubview(loginWithTW)
        
        let loginWithGoogle = UIButton(frame: CGRect(x: 50, y: 600, width: 300, height: 30))
        loginWithGoogle.setTitle("Login With Google", for: .normal)
        loginWithGoogle.setTitleColor(UIColor.red, for: .normal)
        loginWithGoogle.addTarget(self, action: #selector(LoginWithGoogle), for: .touchUpInside)
        view.addSubview(loginWithGoogle)
    }

    @objc func LoginWithFB() {
       
        let loginManager = FBSDKLoginManager()
//        loginManager.logOut()
        loginManager.logIn(withReadPermissions: ["public_profile", "email"] , from: self, handler:{ (loginResult, error) in
            if ((loginResult?.grantedPermissions) != nil) {
                print(loginResult?.token!)
            }
        })
    }
    
    @objc func LoginWithTwitter() {
        
        TWTRTwitter.sharedInstance().logIn(completion: { (session, error) in
            if let session = session {
                print("signed in as \(session.userName )");
            } else {
                print("error: \(error?.localizedDescription ?? "")");
            }
        })
    }

    @objc func LoginWithGoogle() {
        GIDSignIn.sharedInstance().signOut()
        GIDSignIn.sharedInstance().signIn()
    }
    
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            print("logged in as: \(fullName)")
        }
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
