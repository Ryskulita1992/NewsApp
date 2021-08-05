//
//  FollowLinkViewController.swift
//  NewsApp
//
//  Created by admin on 05.08.2021.
//

import Foundation
import UIKit
import WebKit

class FollowLinkViewController: UIViewController{
    
    var link : String?
    let webView = WKWebView()
    private var estimatedProgressObserver: NSKeyValueObservation?
    
    
    private lazy var progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.trackTintColor = .black
        progressView.progressTintColor = .systemBlue
        return progressView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setConstraints()
        setupProgressView()
        setupEstimatedProgressObserver()
        if let urlWebview = link {
            setupWebview(urlWebview)
        }
        
        
    }
    func  setConstraints(){
        view.addSubview(webView)
        webView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(50)
            make.left.right.bottom.equalToSuperview().inset(8)
        }
        
    }
    
    private func setupProgressView() {
        self.navigationController?.navigationBar.isTranslucent = false
        guard let navigationBar = navigationController?.navigationBar else { return }
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.isHidden = false
        navigationBar.addSubview(progressView)
        progressView.snp.makeConstraints{make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview()
        }
        
    }
    
    
    private func setupEstimatedProgressObserver() {
        progressView.isHidden = true
        estimatedProgressObserver = webView.observe(\.estimatedProgress, options: [.new]) { [weak self] webView, _ in
            self?.progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
    private func setupWebview(_ url: String) {
        
        if let url = URL(string: url) {
            let request = URLRequest(url: url)
            webView.navigationDelegate = self
            webView.load(request)        }
    }
    
}


extension FollowLinkViewController: WKNavigationDelegate {
    func webView(_: WKWebView, didStartProvisionalNavigation _: WKNavigation!) {
        if progressView.isHidden {
            // Make sure our animation is visible.
            progressView.isHidden = false
        }
        
        UIView.animate(withDuration: 0.33,
                       animations: {
                        self.progressView.alpha = 1.0
                       })
    }
    
    func webView(_: WKWebView, didFinish _: WKNavigation!) {
        UIView.animate(withDuration: 0.33,
                       animations: {
                        self.progressView.alpha = 0.0
                       },
                       completion: { isFinished in
             
                        self.progressView.isHidden = isFinished
                       })
    }
}

