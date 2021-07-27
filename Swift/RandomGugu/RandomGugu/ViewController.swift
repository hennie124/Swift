//
//  ViewController.swift
//  RandomGugu
//
//  Created by 임현진 on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblNumber1: UILabel!
    @IBOutlet weak var lblNumber2: UILabel!
    @IBOutlet weak var tfAnswer: UITextField!
    

    var c1 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
            Num()
    }


    @IBAction func btnResult(_ sender: UIButton) {
        var a1 =  Int(lblNumber1.text!)!
        var b1 =  Int(lblNumber2.text!)!
        
        c1 = Int(tfAnswer.text!)!
        tfAnswer.text = ""
        
        if (a1 * b1) == c1{
            let CorrectAlert = UIAlertController(title: "결과", message:"정답입니다.", preferredStyle: .alert)
            let CorrectAction = UIAlertAction(title: "다음 문제 진행", style: .default, handler: {ACTION in self.Num()})
            
            CorrectAlert.addAction(CorrectAction)
            present(CorrectAlert, animated: true, completion: nil)
        }else{
            let NotCorrectAlert = UIAlertController(title: "결과", message:"정답이 아닙니다.", preferredStyle: .alert)
            let NotCorrectAction = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: nil)
            
            NotCorrectAlert.addAction(NotCorrectAction)
            present(NotCorrectAlert, animated: true, completion: nil)
        }
        
    }
    func Num() {
        lblNumber1.text = String(Int.random(in: 1..<10))
        lblNumber2.text = String(Int.random(in: 1..<10))
    }
    
}

