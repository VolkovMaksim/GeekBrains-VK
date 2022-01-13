//
//  LoginVKViewController.swift
//  GeekBrains-VK
//
//  Created by Maksim Volkov on 11.01.2022.
//

import UIKit
import WebKit

class LoginVKViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    
    var session = Session.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAuth()
    }
}

private extension LoginVKViewController {
    func loadAuth() {
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "8047756"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        print(urlComponents.url!)
        let request = URLRequest(url: urlComponents.url!)
        webView.load(request)
    }
    
    func frendList() {
        let configuration = URLSessionConfiguration.default
        let usrSession = URLSession(configuration: configuration)
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/friends.get"
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: session.token),
            URLQueryItem(name: "v", value: "5.81")
        ]
        var request = URLRequest(url: urlComponents.url!)
        
        request.httpMethod = "GET"

        // задача для запуска
        let task = usrSession.dataTask(with: request) { (data, response, error) in
            // в замыкании данные, полученные от сервера, мы преобразуем в json
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            // выводим в консоль
            print(json!)
        }
        // запускаем задачу
        task.resume()
    }
    
    func groupList() {
        let configuration = URLSessionConfiguration.default
        let usrSession = URLSession(configuration: configuration)
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/groups.get"
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: session.token),
            URLQueryItem(name: "v", value: "5.81")
        ]
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"

        // задача для запуска
        let task = usrSession.dataTask(with: request) { (data, response, error) in
            // в замыкании данные, полученные от сервера, мы преобразуем в json
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            // выводим в консоль
            print(json!)
        }
        // запускаем задачу
        task.resume()
    }
    
    func photoList() {
        let configuration = URLSessionConfiguration.default
        let usrSession = URLSession(configuration: configuration)
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/photos.getAll"
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: session.token),
            URLQueryItem(name: "v", value: "5.81")
        ]
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"

        // задача для запуска
        let task = usrSession.dataTask(with: request) { (data, response, error) in
            // в замыкании данные, полученные от сервера, мы преобразуем в json
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            // выводим в консоль
            print(json!)
        }
        // запускаем задачу
        task.resume()
    }
    
    func groupSearchList() {
        let configuration = URLSessionConfiguration.default
        let usrSession = URLSession(configuration: configuration)
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/groups.search"
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: session.token),
            URLQueryItem(name: "q", value: "fjord"),
            URLQueryItem(name: "v", value: "5.81")
        ]
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"

        // задача для запуска
        let task = usrSession.dataTask(with: request) { (data, response, error) in
            // в замыкании данные, полученные от сервера, мы преобразуем в json
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            // выводим в консоль
            print(json!)
        }
        // запускаем задачу
        task.resume()
    }
}

extension LoginVKViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard
            let url = navigationResponse.response.url,
            url.path == "/blank.html",
            let fragment = url.fragment
        else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=")}
            .reduce([String:String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        if let token = params["access_token"], let userId = params["user_id"] {
            session.token = token
            session.userId = Int(userId)!
            print("Token \(token)")
            print("user_id \(userId)")
            performSegue(withIdentifier: "login", sender: self)
            decisionHandler(.cancel)
        }
        frendList()
        groupList()
        photoList()
        groupSearchList()
    }
}
