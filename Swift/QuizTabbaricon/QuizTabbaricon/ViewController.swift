//
//  ViewController.swift
//  QuizTabbaricon
//
//  Created by 임현진 on 2021/07/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func BtnSelectbtn(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    
    @IBAction func BtnSelectTimer(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    
    
    @IBAction func BtnSelectPage(_ sender: UIButton) {
        tabBarController?.selectedIndex = 3
    }
}

