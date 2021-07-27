//
//  ViewController.swift
//  quiz32
//
//  Created by 임현진 on 2021/07/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfStartNumber: UITextField!
    @IBOutlet weak var tfLastNumber: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblResult.text = " "
    }

    @IBAction func btnOK(_ sender: Any) {
        
        
        if tfStartNumber.text?.isEmpty == true{
            lblResult.text = "시작 숫자를 입력하세요!"
        }else if tfLastNumber.text?.isEmpty == true{
            lblResult.text = "끝 숫자를 입력하세요!"
        }else {
            let num1 = Int(tfStartNumber.text!)!
            let num2 = Int(tfLastNumber.text!)! + 1
            
            for i in Range(uncheckedBounds:(num1,num2)){
                print(i)
            }

            var sum : Int = 0
            for i in Range(uncheckedBounds:(num1,num2)){
                sum+=i
            }

            lblResult.text = "\(num1)과 \(num2 - 1)의 합계는 \(sum)입니다."
        }
        
    }
    
}

