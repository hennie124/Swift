//
//  ViewController.swift
//  QuizWebPageControl
//
//  Created by 임현진 on 2021/07/21.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblWebPage: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var WebView: WKWebView!
    @IBOutlet weak var myActivityIndicatorView: UIActivityIndicatorView!
    var siteSubject0 = [("네이버","www.naver.com"),("다음","www.daum.net"),("구글","www.google.com"),("CNN","www.cnn.com"),("ABC","www.abc.com"),("TBS","www.international.tbs.com")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWebPage.text = siteSubject0[0].0
        pageControl.numberOfPages = siteSubject0.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.darkGray
        loadWebPage(url: "https://www.naver.com")
        WebView.navigationDelegate = self
        
    }
    
    func loadWebPage(url:String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        WebView.load(myRequest)
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        lblWebPage.text = String(siteSubject0[pageControl.currentPage].0)
        loadWebPage(url: "https://"+siteSubject0[pageControl.currentPage].1)
        WebView.navigationDelegate = self
    }
    
 
    
}//ViewController

extension ViewController : WKNavigationDelegate{
    
    //Indicator 시작
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicatorView.startAnimating()
        myActivityIndicatorView.isHidden = false
        }
    //Indicator 종료
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        myActivityIndicatorView.stopAnimating()
        myActivityIndicatorView.isHidden = true
    }
    //error 발생
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicatorView.stopAnimating()
        myActivityIndicatorView.isHidden = true
    }
}


