//
//  ViewController.swift
//  QuizNavigation
//
//  Created by 임현진 on 2021/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    let imgOn = UIImage(named: "www.png")
    let imgOff = UIImage(named: "ppp.png")
    let imgRed = UIImage(named: "pinkOn.png")
    
    var isOn = true
    var isRed = true
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = imgOn
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectViewController = segue.destination as! SelectViewController
        selectViewController.delegate = self
        selectViewController.isOn = isOn
        selectViewController.isRed = isRed
    }


}//ViewController


extension ViewController:SelectDelegate{
    func didImageOnOffDone(_ controller: SelectViewController, isOn: Bool,isRed:Bool) {
        if  isOn{
            self.isOn = true
            if isRed{
                imgView.image = imgRed
                self.isRed = true
            }else{
                imgView.image = imgOn
                self.isRed = false
            }
        }else{
            imgView.image = imgOff
            self.isOn = false
            self.isRed = false
        }
 
    }
    

}

