//
//  ViewController.swift
//  AllicsCarList
//
//  Created by  on 5/16/19.
//  Copyright © 2019 Donahue_Apps. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate
{
    var webView: WKWebView!
    
    override func loadView()
    {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    

    override func viewDidLoad()
    
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = URL(string: "https://www.google.com/imghp?hl=en&tab=wi&authuser=0")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }


}
