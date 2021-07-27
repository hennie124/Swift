//
//  ViewController.swift
//  QuizPickerViewWeb
//
//  Created by 임현진 on 2021/07/21.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var PickerView: UIPickerView!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    var siteSubject0 = [("네이버","www.naver.com"),("다음","www.daum.net"),("구글","www.google.com"),("CNN","www.cnn.com"),("ABC","www.abc.com"),("TBS","www.international.tbs.com")]
  //  var siteSubject = ["네이버","다음","구글","CNN","CBS","ABC","TBS"]
    
    //var siteSubject1 = ["www.naver.com","www.daum.net","www.google.com","www.cnn.com","www.cbs.com","www.abc.com","www.international.tbs.com"]
    var maxArrayNum = 0
    let viewColumn = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        maxArrayNum = siteSubject0.count
        PickerView.dataSource = self
        PickerView.delegate = self
        loadWebPage(url: "https://www.naver.com")
        webView.navigationDelegate = self
    }
    
    func loadWebPage(url:String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        webView.load(myRequest)
    }
    
//    func CheckURL(_ url:String) -> String {
//        var strUrl = url
//        let flag = strUrl.hasPrefix("https:")
//
//        if !flag{
//            strUrl = "https:" + strUrl
//        }
//        return strUrl
//    }


    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        webView.stopLoading()
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    
    @IBAction func goFast(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
    
}//ViewController

extension ViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        viewColumn
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return maxArrayNum
    }
}//UIPickerViewDataSource

extension ViewController:UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(siteSubject0[row].0)
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        loadWebPage(url: "https://"+siteSubject0[row].1 )
        webView.navigationDelegate = self
    }
}

extension ViewController: WKNavigationDelegate{
    
    //Indicator 시작
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
        }
    //Indicator 종료
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    //error 발생
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
}
