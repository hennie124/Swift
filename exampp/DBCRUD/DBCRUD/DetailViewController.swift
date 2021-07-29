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
    
    // 받아온 데이터
    func receiveData(scode:String, sname:String, sdept:String, sphone: String){
        receiveCode = scode
        receiveName = sname
        receiveDept = sdept
        receivePhone = sphone
    }

    
    @IBAction func btnUpdate(_ sender: UIButton) {
        
        // 받아온 것의 수정한 것을 UpdateModel에 보내기 위해 수정한 텍스트의 변수를 만든다
        let code = tfCode.text
        let name = tfName.text
        let dept = tfDept.text
        let phone = tfPhone.text
        
        //updateModel을 불러와서 보낸다!
        let updateModel = UpdateModel()
        let result = updateModel.UpdateItems(code: code!, name: name!, dept: dept!, phone: phone!)
        
        //완료 , 실패시 띄우는 메세지
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
