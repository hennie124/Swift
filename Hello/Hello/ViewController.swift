//
//  ViewController.swift
//  Hello
//
//  Created by 임현진 on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblHello: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblHello.text = "Hello World!"
    }


}

