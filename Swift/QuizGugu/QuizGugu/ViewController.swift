//
//  ViewController.swift
//  QuizGugu
//
//  Created by 임현진 on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var tvResult: UITextView!
    @IBOutlet weak var PickerView: UIPickerView!
    
    
    var gugu = Array<Int>(1...9)
    //var gugu = [1,2,3,4,5,6,7,8,9]
  //  var gugu1 = []
    var maxArrayNum = 0
    let viewColumn = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        maxArrayNum = gugu.count
        PickerView.dataSource = self
        PickerView.delegate = self
        
        Gugu(i: 0)
    }
    
    func Gugu(i:Int){
        tvResult.text = ""
        for j in 1...10{
            tvResult.text += ("\(i+1) X \(j) = \((i+1) * j) \n")
        }
    }


}//--------------

extension ViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        viewColumn
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return maxArrayNum
    }
    
    
}

extension ViewController:UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(gugu[row])+"단"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            lblResult.text = String(gugu[row])+"단"
            Gugu(i: row)
    }

}

