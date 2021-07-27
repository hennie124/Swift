//
//  ViewController.swift
//  QuizPageControl
//
//  Created by 임현진 on 2021/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblNumber: UILabel!
    
    @IBOutlet weak var pageControl: UIPageControl!
    var number = Array <Int>(1...11)
    var num = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        lblNumber.text = String(number[0])
        pageControl.numberOfPages = number.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.darkGray
    }


    @IBAction func pageChange(_ sender: UIPageControl) {
        lblNumber.text = String(number[pageControl.currentPage])

        num = number[pageControl.currentPage]
        
        if num % 2 == 0{
            lblNumber.text = String(number[pageControl.currentPage])
            lblNumber.textColor = UIColor.blue
        
        }else{
            lblNumber.text = String(number[pageControl.currentPage])
            lblNumber.textColor = UIColor.red
        }
    }
}

