//
//  ViewController.swift
//  PinchGesture
//
//  Created by 임현진 on 2021/07/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgPinch: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_ :)))
        //(_ :) object c의 모양이라고 한다.
        self.view.addGestureRecognizer(pinch)
        
    }
    
    @objc func doPinch(_ pinch:UIPinchGestureRecognizer){
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
    }
    
    

}

