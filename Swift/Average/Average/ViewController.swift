//
//  ViewController.swift
//  Average
//
//  Created by 임현진 on 2021/07/16.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tfKorean: UITextField!
    @IBOutlet weak var tfMath: UITextField!
    @IBOutlet weak var tfEnglish: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblResult.text = "숫자를 입력하세요!"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func btnCal(_ sender: UIButton){
        let korean = Int(tfKorean.text!)!
        let math = Int(tfMath.text!)!
        let english = Int(tfEnglish.text!)!
        
        Cal(korean: korean, math: math, english: english)
        
    }

    //계산
    func Cal(korean:Int , math:Int , english:Int) {
        let tot = korean + math + english
        let avg :Double = Double(tot)/3
        
        switch avg {
        case 90 ... 100:
            lblResult.text = "평균은 \(String(format:"%.2f",avg))이고 학점은 A입니다."
        case 80 ..< 90 :
            lblResult.text = "평균은 \(String(format:"%.2f",avg))이고 학점은 B입니다."
        case 70 ..< 80 :
            lblResult.text = "평균은 \(String(format:"%.2f",avg))이고 학점은 C입니다."
        case 60 ..< 70 :
            lblResult.text = "평균은 \(String(format:"%.2f",avg))이고 학점은 D입니다."
        case 0 ..< 60 :
            lblResult.text = "평균은 \(String(format:"%.2f",avg))이고 학점은 F입니다."
        default:
            lblResult.text = "잘못 입력하셨습니다!"
        }
    
    }
    
}

