//
//  DetailViewController.swift
//  DBCRUD
//
//  Created by 임현진 on 2021/07/28.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tfCode: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfDept: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    
    var receiveCode = ""
    var receiveName = ""
    var receiveDept = ""
    var receivePhone = ""

    override func viewDidLoad() {
        super.viewDidLoad()
  
        tfCode.text = receiveCode
        tfName.text = receiveName
        tfDept.text = receiveDept
        tfPhone.text = receivePhone
        // Do any additional setup after loading the view.
    }
    
    func receiveData(scode:String, sname:String, sdept:String, sphone: String){
        receiveCode = scode
        receiveName = sname
        receiveDept = sdept
        receivePhone = sphone
    }

    
    @IBAction func btnUpdate(_ sender: UIButton) {

        let updateModel = UpdateModel()
        let result = updateModel.UpdateItems(code: receiveCode, name: receiveName, dept: receiveDept, phone: receivePhone)
        
        
        if result{
            let resultAlert = UIAlertController(title: "완료", message: "수정이 되었습니다!", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
                self.navigationController?.popViewController(animated: true)
            })
            
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
        }else{
            let resultAlert = UIAlertController(title: "실패", message: "에러가 발생되었습니다!", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
                self.navigationController?.popViewController(animated: true)
            })
            
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnDelete(_ sender: UIButton) {
        
        let DeleteModel = DeleteModel()
        let result = DeleteModel.DeleteItems(code: receiveCode)
        
        
        if result{
            let resultAlert = UIAlertController(title: "완료", message: "삭제 되었습니다!", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
                self.navigationController?.popViewController(animated: true)
            })
            
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
        }else{
            let resultAlert = UIAlertController(title: "실패", message: "에러가 발생되었습니다!", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
                self.navigationController?.popViewController(animated: true)
            })
            
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
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
