//
//  ViewController.swift
//  AllicsCarList
//
//  Created by  on 5/16/19.
//  Copyright © 2019 Donahue_Apps. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {
    
//    var webView: WKWebView!
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var libraryButton: UIButton!
    @IBOutlet weak var libraryView: UIScrollView!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    var webView: WKWebView =
    {
        let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        webView.translatesAutoresizingMaskIntoConstraints = false
        // allows us to do constrainats programmatically
        // setup WebView
        return webView
        
    }()

    @IBAction func SearchButton(_ sender: Any) {
        var searchEntry = textField.text ?? "Ford Mustang"
        libraryView.isHidden = true
        // add 4 constraints programmatically
        webView.topAnchor.constraint(equalTo: topLabel.bottomAnchor).isActive = true
        webView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        webView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true

        var sampleURL = "https://www.google.com/search?q=\(searchEntry)"
    
        sendRequest(urlstring: sampleURL)
    }
    @IBAction func libraryButtonTapped(_ sender: UIButton)
    {
        libraryView.isHidden = false
        libraryView.layer.zPosition = 100
        exitButton.layer.zPosition = 101
        webView.isUserInteractionEnabled = false
        libraryView.isUserInteractionEnabled = true
        
    tableView.topAnchor.constraint(equalTo: topLabel.bottomAnchor).isActive = true
    tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }
    @IBAction func exitButtonTapped(_ sender: UIButton)
    {
        print("button tapped")
        libraryView.isHidden = true
        tableView.isHidden = true
        tableView.removeFromSuperview()
        libraryView.removeFromSuperview()
        tableView.isHidden = true
        libraryView.isHidden = true
        libraryView.layer.zPosition = 0
    }
    
    
    //Convert String into URL and load the URL
    private func sendRequest(urlstring: String)
    {
        if let myURL = URL(string: urlstring)
        {
            let myRequest = URLRequest(url: myURL)
            webView.load(myRequest)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.sendSubviewToBack(tableView)
        libraryView.isHidden = true
        webView.isUserInteractionEnabled = true
        libraryView.isUserInteractionEnabled = false
        webView.uiDelegate = self
        self.view.addSubview(webView)
        
//        // add 4 constraints programmatically
        webView.topAnchor.constraint(equalTo: topLabel.bottomAnchor).isActive = true
        webView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        webView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true

    }}
