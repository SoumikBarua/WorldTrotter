//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by SB on 5/25/18.
//  Copyright © 2018 SB. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        // Create a web view
        webView = WKWebView()
        
        // Set it as *the* view of this view controller
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("WebViewController loaded its view.")
        
        let myURL = URL(string: "https://www.bignerdranch.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}

//class WebViewController: UIViewController, WKNavigationDelegate {
//
//    var webView: WKWebView!
//
//    override func loadView() {
//        webView = WKWebView()
//        webView.navigationDelegate = self
//
//        // Set it as *the* view of this view controller
//        view = webView
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        print("WebViewController loaded its view.")
//
//        let myURL = URL(string: "https://www.bignerdranch.com")
//        let myRequest = URLRequest(url: myURL!)
//        webView.load(myRequest)
//        webView.allowsBackForwardNavigationGestures = true
//    }
//}
