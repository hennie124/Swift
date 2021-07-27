//
//  ViewController.swift
//  QuizTimerAlert
//
//  Created by 임현진 on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblSelectTime: UILabel!
    
    
    let interval = 1.0
    let timeSelector:Selector = #selector(ViewController.updateTime)
    var a = ""
    var b = ""
    var c = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        lblSelectTime.text = "알람시간을 선택하세요!"
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }


    @IBAction func DatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm" //24시간 HH
        lblSelectTime.text = "선택시간: \(formatter.string(from: datePickerView.date))"
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
        
        //pickerClear 함수를 누를 때 실행한다기 보다는 누르고 비교한 순간 a를 초기화시키게 하기!
        //--> 알람을 한번만 뜨게 하려면 시간 a를 초기화한다.
        //--> 아까 그래서 같은 시간을 선택했을 때 알람이 여러번 뜨게 하는 것이라 하는 것
        //-->네/아니오로 선택부분이 다를 때
        if a == b {
            PickerClear()
            let TimeSample = UIAlertController(title: "알림", message: "설정된 시간입니다.", preferredStyle: .alert)
            let TimeSame = UIAlertAction(title: "네 알겠습니다.", style: .default, handler: nil)
            
            TimeSample.addAction(TimeSame)
            present(TimeSample, animated: true, completion: nil)
        }else{
            
        }
    }
    func PickerClear(){
        a = ""
    }
}

