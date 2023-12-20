//
//  ActivityIndicatorAndWebViewController.swift
//  UIComponents
//
//  Created by Aniket Kadia on 09/05/23.
//

import UIKit
import WebKit

class ActivityIndicatorAndWebViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak private var activityIndicatorProgress: UIActivityIndicatorView!
    @IBOutlet weak private var webView: WKWebView!
    
    //MARK: - Variables
    var coordinator: AppCoordinator?
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Setup View
extension ActivityIndicatorAndWebViewController {
    func setupView() {
        webView.underPageBackgroundColor = .gray
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        guard let urlForApple = URL(string: AppConstants.appleWebsite) else { return }
        let urlRequest = URLRequest(url: urlForApple)
        webView.load(urlRequest)
        activityIndicatorProgress.hidesWhenStopped = true
        activityIndicatorProgress.style = .large
        activityIndicatorProgress.color = .red
    }
}

//MARK: - WKUIDelegate
extension ActivityIndicatorAndWebViewController: WKUIDelegate {
    
    func webView(_ webView: WKWebView, contextMenuConfigurationForElement elementInfo: WKContextMenuElementInfo, completionHandler: @escaping (UIContextMenuConfiguration?) -> Void) {
        
        let share = UIAction(title: AppConstants.shareWithWhatsapp) { _ in
            guard let urlWhatsapp = URL(string: AppConstants.webWhatsAppUrl) else { return }
            webView.load(URLRequest(url: urlWhatsapp))
        }
        
        let openAmazon = UIAction(title: AppConstants.openAmazon) { _ in
            guard let urlAmazon = URL(string: AppConstants.amazonUrl) else { return }
            webView.load(URLRequest(url: urlAmazon))
        }
        
        let configuration = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            UIMenu(title: AppConstants.contextMenuTitle, children: [share, openAmazon])
        }
        completionHandler(configuration)
    }
}

//MARK: WKNavigationDelegate
extension ActivityIndicatorAndWebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction) async -> WKNavigationActionPolicy {
        if let currenturl = navigationAction.request.url?.host, currenturl.contains(AppConstants.amazon) {
            return .cancel
        }
        return .allow
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicatorProgress.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicatorProgress.stopAnimating()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = !webView.canGoBack
    }
}
