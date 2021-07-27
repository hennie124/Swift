//
//  ViewController.swift
//  Quiz_Kanna_02
//
//  Created by 임현진 on 2021/07/26.
//

import UIKit
import WebKit
import Kanna

class ViewController: UIViewController {
    var receiveItem = ""
    @IBOutlet weak var WebView: WKWebView!
    @IBOutlet weak var myActivityIndicatorView: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebPage(url: receiveItem)
        // 2 받아온 receiveItem값을 loadWebPage에 집어넣음
        
        //4 indicate 띄우는 과정
        WebView.navigationDelegate = self
       
    }
    
    func receiveItems(_ item:String){
        // 1 앞에서 받아온 url을 receiveItem이라는 변수에 들어감
        receiveItem = item
    }
    
    func loadWebPage(url:String) {
        //3 받은 주소를 WebView로 띄운다!
        let myUrl = URL(string: url)!
        let myRequest = URLRequest(url: myUrl)
        WebView.load(myRequest)
        print(url)
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

