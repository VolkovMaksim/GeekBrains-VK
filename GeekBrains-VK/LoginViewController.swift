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
        
        scrollView.delegate = self
        
        logoSignIn.image = UIImage(named: "vk_logo")
        loginTF.placeholder = "E-mail/Номер телефона"
        passwordTF.placeholder = "Введите пароль"
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(hideKeyboardGesture)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardWasShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardWillBeHidden),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let checkResult = checkUserData()
        
        if !checkResult {
            showLoginError()
        }
        
        loginTF.text = ""
        passwordTF.text = ""
        
        return checkResult
    }
    
    @IBAction func unwind(unwind: UIStoryboardSegue) {
        
    }

    @IBAction func buttonSignIn(_ sender: UIButton) {
        if loginTF.text == "admin" && passwordTF.text == "1234" {
            print("Захады")
        } else {
            print("Отказано!")
        }
    }
    
    @objc func hideKeyboard() {
        scrollView.endEditing(true)
    }
    
    @objc func keyBoardWasShow(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        // получаем размер клавиатуры
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height, right: 0)
        // для скрола добавляем расстояние, равное клаве
        scrollView.contentInset = contentInset
        scrollView.scrollIndicatorInsets = contentInset
    }
    
    @objc func keyBoardWillBeHidden(notification: Notification) {
        let contentInset = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
}

// MARK: - UIScrollViewDelegate

extension LoginViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0.0
    }
}

private extension LoginViewController {
    func checkUserData() -> Bool {
        guard
            let login = loginTF.text,
            let password = passwordTF.text
        else {
            return false
        }
        if login == "admin" && password == "1234" {
            return true
        } else {
            return false
        }
    }
    
    func showLoginError() {
        let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

