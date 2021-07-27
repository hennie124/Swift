//
//  ViewController.swift
//  ImageView
//
//  Created by 임현진 on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnResize: UIButton!
    var imgOn:UIImage? //전구 켜짐
    var imgOff:UIImage?//전구 꺼짐
    
    var isZoom = false // 이미지 확대 여부
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //이미지 파일 준비
        imgOn = UIImage(named: "www.png")
        imgOff = UIImage(named: "ppp.png")
        
        //이미지 할당
        imgView.image = imgOn
    }

    @IBAction func btnResizeImage(_ sender: UIButton) {
        //이미지 크기를 2배로
        let scale: CGFloat = 2.0
        var newWidth: CGFloat
        var newHeight: CGFloat
        
        if isZoom{
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
            btnResize.setTitle("Image 확대", for:.normal)
        }else{
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            btnResize.setTitle("Image 축소", for:.normal)
        }
        //상태 변수를 반대로 바꿔야 계속적인 실행이 가능함
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        switch  sender.isOn {
        case true:
            imgView.image = imgOn
        default:
            imgView.image = imgOff
        }
//        if  sender.isOn {
//            imgView.image = imgOn
//        }else{
//            imgView.image = imgOff
//        }
    }
}//-------------

