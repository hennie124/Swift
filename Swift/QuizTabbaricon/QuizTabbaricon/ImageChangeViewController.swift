//
//  ViewController.swift
//  ImageChange3
//
//  Created by 임현진 on 2021/07/19.
//

import UIKit

class ImageChangeViewController: UIViewController {

    @IBOutlet weak var ImageName: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    var numImage = 0
    var imgName = ["flower_01.png","flower_02.png","flower_03.png","flower_04.png","flower_05.png","flower_06.png"]
    
    var b = ""
    let interval = 3.0
    let timeSelector:Selector = #selector(ImageChangeViewController.updateTime(numImage:))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ImageName.text = imgName[numImage]
        ImageView.image = UIImage(named: imgName[numImage])
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        updateTime(numImage: numImage)
    }

    @objc func updateTime(numImage:Int){
        self.numImage += 1
        if  self.numImage >= imgName.count{
                self.numImage = 0 //계속 바뀌는 애라서 self를 써야 함!
        }
        displayImage(numImage: numImage)
    }
    
    func displayImage(numImage:Int){
        ImageName.text = imgName[self.numImage]
        ImageView.image = UIImage(named: imgName[self.numImage])
    }

}

