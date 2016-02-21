//
//  BookDetailview.swift
//  swiftBookRecommend
//
//  Created by brzhang on 16/2/21.
//  Copyright © 2016年 brzhang. All rights reserved.
//

import UIKit

class BookDetailview: UIViewController, UIWebViewDelegate {
	
	var webview: UIWebView?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		let bounds = UIScreen.mainScreen().bounds
		webview = UIWebView.init(frame: CGRectMake(0, 0, bounds.width, bounds.height))
		webview?.userInteractionEnabled = true
		webview?.delegate = self
		webview?.backgroundColor = UIColor.blackColor()
		
		self.view.addSubview(webview!)
	}
	
	func loadWeb(currentUrl: String?) {
		guard (currentUrl != nil) else {
			self.dismissViewControllerAnimated(true, completion: nil)
			return
		}
		let url: NSURL = NSURL.init(string: currentUrl!)!
		webview?.loadRequest(NSURLRequest(URL: url))
	}
	
	func webViewDidStartLoad(webView: UIWebView) {
		
		print(webView)
	}
	
	func webViewDidFinishLoad(webView: UIWebView) {
		print(webView)
	}
	
	func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
		print(error)
	}
}
