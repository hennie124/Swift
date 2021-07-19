//
//  ViewController.swift
//  DatePicker
//
//  Created by 임현진 on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var AllView: UIView!
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblPickerTime: UILabel!

    let interval = 1.0
    let timeSelector:Selector = #selector(ViewController.updateTime)
    var a = ""
    var b = ""
    var c = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        lblPickerTime.text = "시간을 선택하세요!"
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func Datepicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm" //24시간 HH
        lblPickerTime.text = "선택시간: \(formatter.string(from: datePickerView.date))"
        
        a = "\(formatter.string(from: datePickerView.date))"

        
    }
    
    @objc func updateTime(){
        let date = NSDate() // Next Step의 약자
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss" //년,월,일, 요일, 오전/오후
        lblCurrentTime.text = "현재시간:\(formatter.string(from: date as Date))"
        
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm"
        b = "\(formatter.string(from: date as Date))"
        
        formatter.dateFormat = "ss"
        c = "\(formatter.string(from: date as Date))"
        
        
//        self.view.backgroundColor = UIColor(red: 255, green: 0, blue: 0, alpha: 255)
        
  //      AllView.backgroundColor = UIColor.red
      print("a:" + a)
      print("b:" + b)
      print("c:" , Int(c)!%2)
        let d = Int(c)!%2
        
            AllView.backgroundColor = UIColor.blue
        if a == b {
            if d == 0 {
                AllView.backgroundColor = UIColor.blue
            }else{
                AllView.backgroundColor = UIColor.red
            }
        
        }else{
            AllView.backgroundColor = UIColor.white
        }
    }
    }
    
    // datepicker의 시간과 updateTime의 시간이 같을 때는 울리고 다를 때는 안울린다?

