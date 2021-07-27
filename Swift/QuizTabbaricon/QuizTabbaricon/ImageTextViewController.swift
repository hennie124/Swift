//
//  ViewController.swift
//  Quizzz
//
//  Created by 임현진 on 2021/07/15.
//

import UIKit

class ImageTextViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblFile: UILabel!
    
    var numImage = 0
    var imageName = ["flower_01.png","flower_02.png","flower_03.png","flower_04.png","flower_05.png","flower_06.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblFile.text = imageName [numImage]
        imgView.image = UIImage(named: imageName[numImage])
    }
    
    
    @IBAction func btnPrev(_ sender: UIButton) {
        numImage -= 1
        if numImage < 0 {
           // 데이터가 늘면 어려움---> numImage = 5
            numImage = imageName.count - 1
        }
        displayImage(numImage: numImage)
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        numImage += 1
        if  numImage >= imageName.count{
            numImage = 0
        }
       displayImage(numImage: numImage)
        //첫번째는  계산한 numImage가 들어갈 값, 두번째는 계산한 numImage 값
        
    }
    
    func displayImage(numImage:Int){
        lblFile.text = imageName[numImage]
        imgView.image = UIImage(named: imageName[numImage])
    }
    

}

