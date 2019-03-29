//
//  ChosenArticle.swift
//  news--api
//
//  Created by Milos Jovanovic on 28/03/2019.
//  Copyright © 2019 Milos Jovanovic. All rights reserved.
//

import UIKit

class ChosenArticle: UIViewController, UIWebViewDelegate {
    
    var news: News!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loadURL()
        webView.delegate = self
        
    }
    

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    
    func loadURL() {
        let url = URL(string: news.url)
        let urlRequest = URLRequest(url: url!)
        
        webView.loadRequest(urlRequest)
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        indicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        indicator.stopAnimating()
        
    }
    
    
    
    
}
