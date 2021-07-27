//
//  SelectViewController.swift
//  QuizNavigation
//
//  Created by 임현진 on 2021/07/22.
//

import UIKit

class SelectViewController: UIViewController {

    @IBOutlet weak var lblOnOff: UILabel!
    @IBOutlet weak var switchRedOn: UISwitch!
    @IBOutlet weak var switchOnOff: UISwitch!
    @IBOutlet weak var lblRedOnOff: UILabel!
    
    var isOn :Bool = false
    var isRed :Bool = false
    var delegate : SelectDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switchOnOff.isOn = isOn
        switchRedOn.isOn = isRed
        
        if isOn{
            lblOnOff.text = "ON"
        }else{
            lblOnOff.text = "OFF"
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        switchOnOff.isOn = isOn
        if isOn{
            lblOnOff.text = "ON"
        }else{
            lblOnOff.text = "OFF"
        }
        switchRedOn.isOn = isRed

    }
    
    @IBAction func SwitchOnOff(_ sender: UISwitch) {
        if sender.isOn{
            switchRedOn.isEnabled = true
            switchRedOn.isHidden = false
            isOn = true
            lblOnOff.text = "ON"
            lblRedOnOff.text = "RED"
            print(12)
        }else{
            switchRedOn.isEnabled = false
            switchRedOn.isHidden = true
            lblRedOnOff.text = ""
            isOn = false
            lblOnOff.text = "OFF"
            print(13)
        }
    }
    @IBAction func SwitchRedOnOff(_ sender: UISwitch) {
        if sender.isOn{
            isRed = true
        }else{
            isRed = false
        }
    }
    
    @IBAction func btnSelectOnOff(_ sender: UIButton) {
        if delegate != nil {
            //여기에 있는 함수가 어디에 있느냐?? ViewController에 있다
            delegate?.didImageOnOffDone(self, isOn: isOn, isRed: isRed)
            print(10)
        }
        navigationController?.popViewController(animated: true)
    }
    

}
