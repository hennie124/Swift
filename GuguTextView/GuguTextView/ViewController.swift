//
//  ViewController.swift
//  GuguTextView
//
//  Created by 임현진 on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfInput: UITextField!
    @IBOutlet weak var tvResult: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnResult(_ sender: UIButton) {
        let inputN = tfInput.text!.trimmingCharacters(in:.whitespacesAndNewlines)
        let inputNumber = Int(tfInput.text!)!
        
        // 곱셈
        if !inputN.isEmpty {
            for i in 1 ... 9 {
                tvResult.text += ("\(inputNumber) X \(i) = \(inputNumber * i)\n")
            }
        }
       
    }
    
}

