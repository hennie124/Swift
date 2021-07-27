//
//  ViewController.swift
//  Quiz33
//
//  Created by 임현진 on 2021/07/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblEmoji: UILabel!
    
    var arrEmoji = ["😀","🥰","😁","😅","🥳","😍"]
    var arrEmojiCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblEmoji.text = arrEmoji[0]
    }
    
    @IBAction func btnOK(_ sender: UIButton) {
               arrEmojiCount += 1
        if arrEmojiCount > 5 {
            arrEmojiCount = 0
        }
               lblEmoji.text = arrEmoji[arrEmojiCount]
       
    }
    
    
    @IBAction func btnPrev(_ sender: UIButton) {
        arrEmojiCount -= 1
 if arrEmojiCount < 0 {
     arrEmojiCount = 5
 }
        lblEmoji.text = arrEmoji[arrEmojiCount]

        }
    
}

