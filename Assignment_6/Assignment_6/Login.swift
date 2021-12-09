//
//  Login.swift
//  Assignment_6
//
//  Created by DCS on 06/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Login: UIViewController {

    private let lbluname : UILabel = {
        let lbl = UILabel()
        lbl.text = "Enter Username"
        return lbl
    }()
    
    private let txtuname : UITextField = {
        let txt = UITextField()
        txt.placeholder = "@example.com"
        txt.borderStyle = UITextField.BorderStyle.roundedRect
        return txt
    }()
    
    private let lblpass : UILabel = {
        let lbl = UILabel()
        lbl.text = "Enter Password"
        return lbl
    }()
    private let txtupass : UITextField = {
        let txt = UITextField()
        txt.placeholder = ""
        txt.borderStyle = UITextField.BorderStyle.roundedRect
        return txt
    }()
    
    private let lblswitch : UILabel = {
        let lbl = UILabel()
        lbl.text = "Remember Me"
        return lbl
    }()
    
    private let btnlogin:UIButton={
        let btn1 = UIButton()
        btn1.setTitle("Login", for: .normal)
        btn1.backgroundColor = .red
        btn1.layer.cornerRadius = 10
        btn1.addTarget(self, action: #selector(navigate), for: .touchUpInside)
        return btn1
        
    }()
    
    @objc public func navigate()
    {
       if(txtuname.text == "Admin" && txtupass.text == "Admin")
       {
        let hm = HomePage()
        //let nav = UINavigationController(rootViewController: reg)
        navigationController?.pushViewController(hm, animated: false)
        //nav.setNavigationBarHidden(true, animated: false)
        present(hm,animated: false)
        print("click")
        }
    }
    private let btnregister:UIButton={
        let btn1 = UIButton()
        btn1.setTitle("Register", for: .normal)
        btn1.backgroundColor = .red
        btn1.layer.cornerRadius = 10
        btn1.addTarget(self, action: #selector(navreg), for: .touchUpInside)
        return btn1
        
    }()
    
    @objc public func navreg()
    {
             let rg = Registration()
            //let nav = UINavigationController(rootViewController: reg)
            navigationController?.pushViewController(rg, animated: false)
            //nav.setNavigationBarHidden(true, animated: false)
            present(rg,animated: false)
    
    }
    private let switch1:UISwitch = {
        let sw=UISwitch()
        sw.addTarget(self, action: #selector(HandleSwitch), for: .valueChanged)
        return sw
        
    }()
    @objc func HandleSwitch()
    {
        print(switch1.isOn)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(lbluname)
        view.addSubview(txtuname)
        view.addSubview(lblpass)
        view.addSubview(txtupass)
        view.addSubview(btnlogin)
        view.addSubview(lblswitch)
        view.addSubview(switch1)
        view.addSubview(btnregister)
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lbluname.frame = CGRect(x: 20, y: 40, width: view.frame.size.width-40, height: 30)
        txtuname.frame = CGRect(x: 20, y: 80, width: view.frame.size.width-40, height: 30)
        lblpass.frame = CGRect(x: 20, y: 120, width: view.frame.size.width-40, height: 30)
        txtupass.frame = CGRect(x: 20, y: 160, width: view.frame.size.width-40, height: 30)
        lblswitch.frame = CGRect(x: 20, y: 200, width: view.frame.size.width-40, height: 30)
        switch1.frame = CGRect(x: 160, y: 200, width: view.frame.size.width-40, height: 30)
        
        btnlogin.frame = CGRect(x: 20, y: 240, width: view.frame.size.width-40, height: 30)
        btnregister.frame = CGRect(x: 20, y: 280, width: view.frame.size.width-40, height: 30)
        
    }

}
