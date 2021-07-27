//
//  AddViewController.swift
//  QuizTable
//
//  Created by 임현진 on 2021/07/23.
//

import UIKit

var imagesFileName = ["cart.png","clock.png","pencil.png"]
var imageArray = [UIImage?]()
var maxArrayNum = 0
let viewColumn = 1

class AddViewController: UIViewController{
//    var imagesFileName = ["cart.png","clock.png","pencil.png"]
//    var imageArray = [UIImage?]()
//    var maxArrayNum = 0
//    let viewColumn = 1
    
    @IBOutlet weak var tfAddItem: UITextField!
    @IBOutlet weak var ImgView: UIImageView!
    @IBOutlet weak var AddPicker: UIPickerView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        maxArrayNum = imagesFileName.count
         
         for i in 0..<maxArrayNum{
             let image = UIImage(named: imagesFileName[i])
             imageArray.append(image)
         }
         
      AddPicker.dataSource = self
      AddPicker.delegate = self
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!)
        itemsImageFile.append("clock.png")
        navigationController?.popViewController(animated: true)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

} //AddViewController

extension AddViewController: UIPickerViewDataSource{
    //pickerView의 컬럼 갯수 --> 2개면 양쪽으로 나옴
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return viewColumn
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return maxArrayNum
    }
}

//UIPickerViewDelegate는 pickerView의 기능을 구현하게 하는 것
extension AddViewController: UIPickerViewDelegate{
    //PickerView에 Title 입히기
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView{
                let imageView2 = UIImageView(image: imageArray[row])
                imageView2.frame = CGRect(x: 0, y: 0, width: 50, height: 20)
                return imageView2
    }

    //PickerView에 Image 선택했을 경우
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ImgView.image = imageArray[row]
    }
}

