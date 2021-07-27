//
//  ViewController.swift
//  Navigation
//
//  Created by 임현진 on 2021/07/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    let imgOn = UIImage(named: "www.png")
    let imgOff = UIImage(named: "ppp.png")
    
    var isOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = imgOn
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        //인스턴스를 만들어서 클라스를 만들어보냄을 글로 보여준다.
        if segue.identifier == "editButton"{
            editViewController.textWayValue = "Segue: Use Button!"
            print(1)
        }else{
            editViewController.textWayValue = "Segue:Use Bar Button!"
            print(2)
        }
        //메인에서 쓴 메시지를 수정부분에서 확인할 수 있게 만든 것
        editViewController.textMessage = tfMessage.text!
        editViewController.delegate = self //EditDelegate 와 연결
        editViewController.isOn = isOn       //self.isOn
        print(3)
    }

}//ViewController

//EditViewController에서 수정해서 왔을 때 수정한 것이 와야 하니까 여기서 설정한다!
extension ViewController:EditDelegate{
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if  isOn{
            imgView.image = imgOn
            self.isOn = true
            print(4)
        }else{
            imgView.image = imgOff
            self.isOn = false
            print(5)
        }
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        tfMessage.text = message
        print(6)
    }
    
    
}

