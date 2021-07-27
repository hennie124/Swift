//
//  ViewController.swift
//  MessageQuiz
//
//  Created by 임현진 on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tvMessage: UITextView!
    @IBOutlet weak var tfMessage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSend(_ sender: UIButton) {
        let strInput = tfMessage.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if !strInput.isEmpty{
            //누적하는 것은 +=로 해준다!
            tvMessage.text += tfMessage.text! + "\n"
        }
    }
    
    @IBAction func btnEmoji(_ sender: UIButton) {
        //Emoji버튼을 누르면 emoji가 tfMessage에 올라간다
        let Emoji = "😀"
        tfMessage.text! += Emoji
    }
}

