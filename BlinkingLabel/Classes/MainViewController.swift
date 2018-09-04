//
//  MainViewController.swift
//  BlinkingLabel
//
//  Created by Ganesh Kumar on 03/09/18.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

public class MainViewController: UIViewController {

    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.green
        
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 30))
        label.text = "Main View"
        label.textColor = UIColor.red
        view.addSubview(label)
        
        let loginWithFB = UIButton(frame: CGRect(x: 150, y: 300, width: 200, height: 30))
        loginWithFB.center = view.center
        loginWithFB.setTitle("Login With FB", for: .normal)
        loginWithFB.setTitleColor(UIColor.red, for: .normal)
        loginWithFB.addTarget(self, action: #selector(LoginWithFB), for: .touchUpInside)
        view.addSubview(loginWithFB)
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
