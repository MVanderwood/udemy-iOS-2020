//
//  ViewController.swift
//  WebViewApp
//
//  Created by Michael Vanderwood on 8/20/20.
//  Copyright © 2020 vanderwood.co. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView?
    @IBOutlet weak var searchBar: UISearchBar?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?

    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar?.delegate = self

        guard let url = URL(string: "https://www.google.com") else { return backBarButtonItemPressed(UIBarButtonItem()) }

        webView?.load(URLRequest(url: url))

        guard let indicator = activityIndicator else { return }
        webView?.addSubview(indicator)
        indicator.startAnimating()

        webView?.navigationDelegate = self
        indicator.hidesWhenStopped  = true
    }

    @IBAction func backBarButtonItemPressed(_ sender: UIBarButtonItem) {
        if let webView = webView, webView.canGoBack {
            webView.goBack()
        }
    }

    @IBAction func forwardBarButtonItemPressed(_ sender: UIBarButtonItem) {
        if let webView = webView, webView.canGoForward {
            webView.goForward()
        }
    }

    @IBAction func refreshBarButtonItemPressed(_ sender: UIBarButtonItem) {
        webView?.reload()
    }

    @IBAction func stopBarButtonItemPressed(_ sender: UIBarButtonItem) {
        webView?.stopLoading()
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator?.stopAnimating()
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicator?.stopAnimating()
    }

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        activityIndicator?.startAnimating()
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()

        guard let text = searchBar.text, let url = URL(string: text) else { return }

        webView?.load(URLRequest(url: url))
    }
}
