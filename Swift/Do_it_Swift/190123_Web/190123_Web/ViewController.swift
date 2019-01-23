//
//  ViewController.swift
//  190123_Web
//
//  Created by 김회인 on 23/01/2019.
//  Copyright © 2019 HOEINN. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var txtUrl: UITextField!
    
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
        
        myWebView.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadWebPage("http://naver.com")
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "loading" {
            if myWebView.isLoading {
                myActivityIndicator.startAnimating()
                myActivityIndicator.isHidden = false
            } else {
                myActivityIndicator.stopAnimating()
                myActivityIndicator.isHidden = true
            }
        }
    }
    
    
    @IBAction func btnGotoUrl(_ sender: UIButton) {
    }
    
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("http://daum.net")
    }
    
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("http://cafe.naver.com")
    }
    
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
    }
    
    
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    
}
