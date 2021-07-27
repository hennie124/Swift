//
//  ViewController.swift
//  Next
//
//  Created by 임현진 on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblWelcome: UILabel!
//    var click = 1
    var clickBoolean : Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func BtnName(_ sender: UIButton) {
//        if(click%2==1){
//            lblWelcome.text?.append("임현진")
//        }else{
//            lblWelcome.text = "Welcome!"
//        }
//       click+=1
        
        if(clickBoolean){
               lblWelcome.text?.append("임현진")
            clickBoolean = false
             }else{
                   lblWelcome.text = "Welcome!"
                clickBoolean = true
               }
    }
}

