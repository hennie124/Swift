//
//  ViewController.swift
//  Quiz31
//
//  Created by 임현진 on 2021/07/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfNumber1: UITextField!
    @IBOutlet weak var tfNumber2: UITextField!
    @IBOutlet weak var tfResult: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblResult.text = "숫자를 입력하세요!"
    }

    @IBAction func btnAdd(_ sender: UIButton) {
        let num1 = Int(tfNumber1.text!)!
        let num2 = Int(tfNumber2.text!)!
        if tfNumber1.text?.isEmpty == true{
            lblResult.text = "1번 숫자를 입력하세요!"
        }else if tfNumber2.text?.isEmpty == true{
            lblResult.text = "2번 숫자를 입력하세요!"
        }else{
            lblResult.text = "계산이 완료되었습니다!"
        }
        
        Add(num1: num1, num2: num2)
    }
    
    func Add(num1:Int , num2:Int) {
        if num1%2==1 || num2%2==1 {
            lblResult.text = "짝수를 입력해주세요!"
        }else{
            tfResult.text = String(num1+num2)
        }
    }
}

