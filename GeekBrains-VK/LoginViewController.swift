//
//  ViewController.swift
//  GeekBrains-VK
//
//  Created by Maksim Volkov on 29.11.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var logoSignIn: UIImageView!
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoSignIn.image = UIImage(named: "vk_logo")
        loginTF.placeholder = "E-mail/Номер телефона"
        passwordTF.placeholder = "Введите пароль"
    }

    @IBAction func buttonSignIn(_ sender: UIButton) {
        if loginTF.text == "admin" && passwordTF.text == "1234" {
            print("Захады")
        } else {
            print("Отказано!")
        }
    }
}

