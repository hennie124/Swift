//
//  ViewController.swift
//  MultiLine
//
//  Created by 임현진 on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfText: UITextField!
    @IBOutlet weak var tvResult: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tvResult.isEditable = false //Read Only
    }


    @IBAction func btnAdd(_ sender: UIButton) {
        //enter 값과 빈 값 데이터를 없앤다!
        let strInput = tfText.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if !strInput.isEmpty{
            //누적하는 것은 +=로 해준다!
            tvResult.text += tfText.text! + "\n"
        }
      
    }
}//--------------

