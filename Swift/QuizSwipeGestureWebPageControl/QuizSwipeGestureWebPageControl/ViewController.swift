//
//  ViewController.swift
//  QuizSwipeGestureWebPageControl
//
//  Created by 임현진 on 2021/07/21.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var WebView: WKWebView!
    @IBOutlet weak var myActivityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var siteSubject0 = [("네이버","www.naver.com"),("다음","www.daum.net"),("구글","www.google.com"),("CNN","www.cnn.com"),("ABC","www.abc.com"),("TBS","www.international.tbs.com")]
    var imgLeft = [UIImage]()
    var imgRight = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = siteSubject0.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.darkGray
        
        loadWebPage(url: "https://www.naver.com")
        WebView.navigationDelegate = self
        
        //한 손가락 Gesture 구성
        makeSingleTouch()
    }

    func loadWebPage(url:String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        WebView.load(myRequest)
    }
    
    func makeSingleTouch(){
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.left:
                pageControl.currentPage -= 1
                loadWebPage(url: "https://"+siteSubject0[pageControl.currentPage].1)
                WebView.navigationDelegate = self
            case UISwipeGestureRecognizer.Direction.right:
                pageControl.currentPage += 1
                loadWebPage(url: "https://"+siteSubject0[pageControl.currentPage].1)
                WebView.navigationDelegate = self
//                imgView.image = UIImage(named: images[ pageControl.currentPage])
            default:
                break
            }
        }
    }
    
    
    @IBAction func pageChange(_ sender: UIPageControl) {
        loadWebPage(url: "https://"+siteSubject0[pageControl.currentPage].1)
        WebView.navigationDelegate = self
    }
    
    
}//ViewController

extension ViewController: WKNavigationDelegate{
    
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


