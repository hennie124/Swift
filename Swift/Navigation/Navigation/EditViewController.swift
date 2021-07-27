//
//  EditViewController.swift
//  Navigation
//
//  Created by 임현진 on 2021/07/22.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var lblWay: UILabel!
    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var lblOnOff: UILabel!
    @IBOutlet weak var swSwitch: UISwitch!
    
    var textWayValue : String  = ""
    var textMessage : String = ""
    var isOn : Bool = false
    var delegate : EditDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblWay.text = textWayValue
        tfMessage.text = textMessage
        
        print(7)
        swSwitch.isOn = isOn
        if isOn{
            lblOnOff.text = "ON"
        }else{
            lblOnOff.text = "OFF"
        }
        
        print(8)
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            //여기에 있는 함수가 어디에 있느냐?? ViewController에 있다
            delegate?.didMessageEditDone(self, message: tfMessage.text!)
            print(9)
            delegate?.didImageOnOffDone(self, isOn: isOn)
            print(10)
        }
        navigationController?.popViewController(animated: true)
        print(11)
    }
    
    @IBAction func swImageOff(_ sender: UISwitch) {
        if sender.isOn{
            isOn = true
            lblOnOff.text = "ON"
            print(12)
        }else{
            isOn = false
            lblOnOff.text = "OFF"
            print(13)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
