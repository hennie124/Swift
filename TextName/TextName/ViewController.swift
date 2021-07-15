//
//  ViewController.swift
//  TextName
//
//  Created by 임현진 on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var lblMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblMessage.text = "환영합니다."
    }
    @IBAction func btnSend1(_ sender: UIButton) {
        //        if tfName.text?.isEmpty == true{
        //            lblMessage.text = "텍스트를 추가해주세요."
        //        }else{
        //            lblWelcome.text = "Welcome!\(tfName.text!)"
        //            lblMessage.text = "텍스트를 추가했습니다."
        //        }
                lblWelcome.text?.append(tfName.text!)
                lblMessage.text?.append(tfName.text!)
    }


    @IBAction func btnClear(_ sender: UIButton) {
        lblWelcome.text = "Welcome!"
        tfName.text?.removeAll()
        lblMessage.text = "텍스트를 추가해주세요"
    }
}//viewController

