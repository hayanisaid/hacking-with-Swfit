//
//  ViewController.swift
//  simple browser
//
//  Created by mac on 5/28/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView : WKWebView!
    var progressView : UIProgressView!
    var backButton  : UIButton!
    let websites = ["www.apple.com","www.google.com","www.twitter.com"]

    override func loadView() {
         webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
           let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
          progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progressView)
         backButton = UIButton(type: .system)
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(webView, action: #selector(webView.goBack), for: .touchUpInside)
        let BarBackButton = UIBarButtonItem(customView: backButton)
        navigationItem.backBarButtonItem = BarBackButton
        navigationItem.leftBarButtonItem = BarBackButton
        
        
        
        toolbarItems = [progressButton,spacer,refresh]
         navigationController?.isToolbarHidden = false
        webView.addObserver(self, forKeyPath:  #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        let url = URL(string:"https://\(websites[0])")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
        // Do any additional setup after loading the view, typically from a nib.
    }
 

    
    @objc func openTapped(){
        let ac = UIAlertController(title: "Open page", message: nil, preferredStyle: .actionSheet)
        for website in websites{
          ac.addAction(UIAlertAction(title: website, style: .default, handler: openPage))
        }
        
        
         ac.addAction(UIAlertAction(title: "Cancel", style: .default))
         ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac,animated: true)
        
    }
    
    func openPage(action:UIAlertAction){
        let url = URL(string: "https://" + action.title!)!
        webView.load(URLRequest(url: url))
        
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if(keyPath == "estimatedProgress"){
            progressView.progress = Float(webView.estimatedProgress)
        }
    }

    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url
        if let host = url?.host{
            for website in websites{
                if host.contains(website){
                   decisionHandler(.allow)
                    return
                }
            }
        }
        decisionHandler(.cancel)
    }
}

