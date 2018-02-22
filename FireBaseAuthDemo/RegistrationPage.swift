//
//  RegistrationForm.swift
//  FireBaseAuthDemo
//
//  Created by Pratik Hirve on 22/02/2018.
//  Copyright © 2018 Pratik Hirve. All rights reserved.
//

import UIKit
import  Firebase

class RegistrationPage: UIViewController {
    
    
    
    
    let loginLable:UILabel = {
        let login = UILabel()
        login.translatesAutoresizingMaskIntoConstraints = false
        //        login.backgroundColor = .red
        login.text = "Register"
        login.font = UIFont.boldSystemFont(ofSize: 34)
        return login
        
    }()
    
    let contentHolder: UIView = {
        let holder = UIView()
        holder.translatesAutoresizingMaskIntoConstraints = false
        holder.backgroundColor = UIColor.lightGray
        holder.layer.cornerRadius = 8
        return holder
        
    }()
    
    
    let userNameLable:UILabel = {
        let userName = UILabel()
        userName.translatesAutoresizingMaskIntoConstraints = false
        //        userName.backgroundColor = .red
        userName.text = "Email Address"
        //        userName.font = UIFont.boldSystemFont(ofSize: 34)
        return userName
        
    }()
    
    let emailAddressTextField: UITextField = {
        let emailAddress = UITextField()
        emailAddress.layer.cornerRadius = 8
        emailAddress.backgroundColor = .white
        emailAddress.translatesAutoresizingMaskIntoConstraints = false
        //        emailAddress.backgroundColor = .red
        //        emailAddress.placeholder = " Email Address"
        return emailAddress
    }()
    
    
    let passwordLable:UILabel = {
        let password = UILabel()
        password.translatesAutoresizingMaskIntoConstraints = false
        
        password.text = "Password"
        //        userName.font = UIFont.boldSystemFont(ofSize: 34)
        return password
        
    }()
    
    let passwordTextField: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.backgroundColor = .white
        password.layer.cornerRadius = 8
        password.isSecureTextEntry = true
        //        emailAddress.placeholder = " Email Address"
        return password
    }()
    
    let registerButton:UIButton = {
        let register = UIButton()
        register.backgroundColor = UIColor.blue
        register.layer.cornerRadius = 8
        register.setTitle("Register", for: UIControlState.normal)
        register.translatesAutoresizingMaskIntoConstraints = false
        register.layer.borderWidth = 1
        
        return register
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginLable)
        view.addSubview(contentHolder)
        contentHolder.addSubview(userNameLable)
        contentHolder.addSubview(emailAddressTextField)
        contentHolder.addSubview(passwordLable)
        contentHolder.addSubview(passwordTextField)
//        contentHolder.addSubview(loginButton)
        contentHolder.addSubview(registerButton)
        
//        loginButton.addTarget(self, action: #selector(loginButtonClicked), for: UIControlEvents.touchDown)
        registerButton.addTarget(self, action: #selector(registerButtonClicked), for: UIControlEvents.touchDown)
        addAllConstraints()

        // Do any additional setup after loading the view.
    }
    @objc func registerButtonClicked(){
        
        if let email = emailAddressTextField.text , let password = passwordTextField.text {
            
            Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                if user != nil {
                    print("Success")
                    
                    let alert = UIAlertController(title: "Registration Successful", message: "You are now successfully registered using FirebaseAuth", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                     self.dismiss(animated: true, completion: nil)
                }
                if error != nil {
                    
                    let alert = UIAlertController(title: "Registration Failed", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    print(error?.localizedDescription)
                }
            })
        }
        
        
    
    }
    
  
    
    func addAllConstraints(){
        let loginView = ["LL":loginLable,"CH":contentHolder,"UNL":userNameLable,"EATF": emailAddressTextField,"PL":passwordLable,"PTF":passwordTextField,"R":registerButton]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[LL(\(view.frame.width * 0.4))]|", options: NSLayoutFormatOptions.alignAllLeft, metrics: nil, views: loginView))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(view.frame.height * 0.2)-[LL(50)]|", options: NSLayoutFormatOptions.alignAllTop, metrics: nil, views: loginView))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[CH]-10-|", options: NSLayoutFormatOptions.alignAllLeft, metrics: nil, views: loginView))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(view.frame.height * 0.3)-[CH(300)]|", options: NSLayoutFormatOptions.alignAllTop, metrics: nil, views: loginView))
        
        contentHolder.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[UNL]-80-|", options: NSLayoutFormatOptions.alignAllLeft, metrics: nil, views: loginView))
        contentHolder.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[UNL(30)]|", options: NSLayoutFormatOptions.alignAllTop, metrics: nil, views: loginView))
        
        contentHolder.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[EATF]-80-|", options: NSLayoutFormatOptions.alignAllLeft, metrics: nil, views: loginView))
        contentHolder.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-40-[EATF(30)]|", options: NSLayoutFormatOptions.alignAllTop, metrics: nil, views: loginView))
        
        contentHolder.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[PL]-80-|", options: NSLayoutFormatOptions.alignAllLeft, metrics: nil, views: loginView))
        contentHolder.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-90-[PL(30)]|", options: NSLayoutFormatOptions.alignAllTop, metrics: nil, views: loginView))
        
        contentHolder.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[PTF]-80-|", options: NSLayoutFormatOptions.alignAllLeft, metrics: nil, views: loginView))
        contentHolder.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-130-[PTF(30)]|", options: NSLayoutFormatOptions.alignAllTop, metrics: nil, views: loginView))
        
        contentHolder.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[R(90)]|", options: NSLayoutFormatOptions.alignAllLeft, metrics: nil, views: loginView))
        contentHolder.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-180-[R(30)]|", options: NSLayoutFormatOptions.alignAllTop, metrics: nil, views: loginView))
        
//        contentHolder.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[R(90)]|", options: NSLayoutFormatOptions.alignAllLeft, metrics: nil, views: loginView))
//        contentHolder.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-240-[R(30)]|", options: NSLayoutFormatOptions.alignAllTop, metrics: nil, views: loginView))
        
        
        
    }


    override func didReceiveMemoryWarning() {
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
