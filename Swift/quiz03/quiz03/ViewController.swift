//
//  ViewController.swift
//  quiz03
//
//  Created by 임현진 on 2021/07/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfNumber: UITextField!
    @IBOutlet weak var lblBool: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblBool.text = "숫자를 입력하세요"
    }
    

    @IBAction func btnOK(_ sender: Any) {
        let numCheck = cal(str: tfNumber.text!)
        if numCheck == 1 {
            let returnValue = numberDecision(str: tfNumber.text!)
            lblBool.text = "입력하신 숫자는 \(returnValue)입니다."
            
        }else{
            lblBool.text = "숫자를 확인하세요"
        }
        
           
    }
    func cal(str: String!) -> Int{
        let check = str.trimmingCharacters(in: .whitespacesAndNewlines )
        if check.isEmpty {
            return 0
        }else{
            return 1
        }
    }
    func numberDecision(str:String!) -> String{
        if Int(str)!%2 == 0 {
            return "짝수"
        }else{
            return "홀수"
        }
    }
    //방법 1
//        var message : String
//        let checknumber = Int(tfNumber.text!) ?? 0
//        if checknumber % 2 == 0{
//           message = "짝수"
//        } else{
//            message = "홀수"
//        }
//        lblBool.text = "입력하신 숫자는 \(message)입니다."

}
