//
//  ViewController.swift
//  Emoji
//
//  Created by 임현진 on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Emoji: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func Smile(_ sender: UIButton) {
        let someCharacter :Character = "😀"
        Emoji.text?.append(someCharacter)
    }
}

