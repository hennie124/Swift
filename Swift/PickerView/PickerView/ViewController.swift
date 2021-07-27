//
//  ViewController.swift
//  PickerView
//
//  Created by 임현진 on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblImageFileName: UILabel!
    @IBOutlet weak var pickerImage: UIPickerView!
    @IBOutlet weak var imageView: UIImageView!
    
    var imageFileName = ["w1.jpg","w2.jpg","w3.jpg","w4.jpg","w5.jpg","w6.jpg","w7.jpg","w8.jpg","w9.jpg","w10.jpg"]
    var imageArray = [UIImage?]()
    var maxArrayNum = 0
    let viewColumn = 1
    
    //처음에 조금 느려도 좋지만 사용 중에 느려지는 것은 용납 못해!!
    override func viewDidLoad() {
        super.viewDidLoad()
       maxArrayNum = imageFileName.count
        
        for i in 0..<maxArrayNum{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        lblImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
        
        pickerImage.dataSource = self
        pickerImage.delegate = self
    }


}//ViewController

//UIPickerViewDataSource는 pickerView의 화면
extension ViewController: UIPickerViewDataSource{
    //pickerView의 컬럼 갯수 --> 2개면 양쪽으로 나옴
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return viewColumn
    }
    
    //출력할 이미지 파일 갯수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component:Int) -> Int {
        return maxArrayNum
    }
}

//UIPickerViewDelegate는 pickerView의 기능을 구현하게 하는 것
extension ViewController: UIPickerViewDelegate{
    //PickerView에 Title 입히기
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageFileName[row]
    }
    
    //PickerView에 Image 선택했을 경우
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row]
    }
}

