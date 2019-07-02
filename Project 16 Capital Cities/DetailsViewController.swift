//
//  DetailsViewController.swift
//  Project 16 Capital Cities
//
//  Created by Rinalds Domanovs on 02/07/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import WebKit
import UIKit

class DetailsViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    var url: URL!

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        webView.load(URLRequest(url: url))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
