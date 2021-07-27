//
//  ViewController.swift
//  Calculator
//
//  Created by 임현진 on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfNumber1: UITextField!
    @IBOutlet weak var tfNumber2: UITextField!
    @IBOutlet weak var tfAdd: UITextField!
    @IBOutlet weak var tfSub: UITextField!
    @IBOutlet weak var tfMul: UITextField!
    @IBOutlet weak var tfInt: UITextField!
    @IBOutlet weak var tfDouble: UITextField!
    @IBOutlet weak var lblMessage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblMessage.text = "숫자를 확인하세요!"
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    @IBAction func btnCal(_ sender: UIButton) {
        if (tfNumber1.text?.isEmpty == true) || (tfNumber2.text?.isEmpty == true) {
            lblMessage.text = "숫자를 입력하세요!"
        }else{
            
            var add : Int = Int(tfNumber1.text!)! + Int(tfNumber2.text!)!
            var sub : Int = Int(tfNumber1.text!)! - Int(tfNumber2.text!)!
            var mul : Int = Int(tfNumber1.text!)! * Int(tfNumber2.text!)!
            var int : Int = Int(tfNumber1.text!)! / Int(tfNumber2.text!)!
            var dou : Int = Int(tfNumber1.text!)! % Int(tfNumber2.text!)!
            
            tfAdd.text = String(add)
            tfSub.text = String(sub)
            tfMul.text = String(mul)
            tfInt.text = String(int)
            tfDouble.text = String(dou)
            
            lblMessage.text = "계산이 되었습니다!"
        }
    
    }
}//----ViewController

