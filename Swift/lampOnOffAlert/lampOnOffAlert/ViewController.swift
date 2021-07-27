//
//  ViewController.swift
//  lampOnOffAlert
//
//  Created by 임현진 on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {
    let imgOn = UIImage(named: "www.png")
    let imgOff = UIImage(named:"ppp.png")
    let imgRemove = UIImage(named: "remove.png")
    
    var isLampOn = true //Lamp State -->상태변수

    @IBOutlet weak var lampImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lampImage.image = imgOn
    }


    @IBAction func btnLampOn(_ sender: UIButton) {
        if isLampOn {
            let lampOnAlert = UIAlertController(title: "경고", message:"현재 ON 상태입니다.", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: nil)
            
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
            
        }else{
           LampOnn()
        }
    }

    
    @IBAction func btnLampOff(_ sender: UIButton) {
        if isLampOn{
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄겠습니까?", preferredStyle: .alert)
            let offAction = UIAlertAction(title: "네", style: .default, handler: {ACTION in self.LampOFFF()})
            let cancelAction = UIAlertAction(title: "아니오", style: .default, handler: nil)
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            present(lampOffAlert, animated: true, completion: nil)
        }else{
               
        }
    
    }

    
    @IBAction func btnLampRemove(_ sender: UIButton) {
        if isLampOn {
            let lampRemoveAlert = UIAlertController(title: "램프 제거?", message: "램프를 제거할까요?", preferredStyle: .alert)
            let  OffNOAction = UIAlertAction(title: "아니요, 끕니다!", style: .default, handler: {ACTION in self.LampOFFF()})
            let OnOKAction = UIAlertAction(title: "아니요, 켭니다!", style: .default, handler:{ACTION in self.LampOnn()})
            let removeOKAction = UIAlertAction(title: "네, 제거합니다!", style: .default, handler: {ACTION in self.LampRemove()})
            
            lampRemoveAlert.addAction(OffNOAction)
            lampRemoveAlert.addAction(OnOKAction)
            lampRemoveAlert.addAction(removeOKAction)
            present(lampRemoveAlert, animated: true, completion: nil)
            
            
        }
    }
    
    func LampOnn() {
        lampImage.image = imgOn
        isLampOn = true
    }
    
    func LampOFFF(){
        self.lampImage.image = self.imgOff
        self.isLampOn = false
    }
    
    func LampRemove(){
        lampImage.image = imgRemove
        self.isLampOn = true
    }
}//-------------------

