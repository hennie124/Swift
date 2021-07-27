//
//  ViewController.swift
//  Quizarr
//
//  Created by 임현진 on 2021/07/16.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tfScore: UITextField!
    @IBOutlet weak var SubjectScore: UILabel!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var lblSubject: UILabel!
    
    var scoreCount = 0
    var subject = ["국어","수학","영어","요약"]
    var resultArray = ["높습니다.","같습니다.","낮습니다."]
    var scoreSubject = [0,0,0]
    var tot = 0
    var avg : Double = 0
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblResult.text = ""
        lblSubject.text = subject[scoreCount]
    }

    @IBAction func btnCal(_ sender: UIButton) {
        if scoreCount < 3 {
            
            scoreSubject[scoreCount] = Int(tfScore.text!)!
            
            scoreCount += 1
            tfScore.text = ""
            lblSubject.text = subject[scoreCount]
//            lblResult.text = String(scoreCount)
            
            if scoreCount == 3{
                tfScore.isHidden = true
                tot = scoreSubject[0]+scoreSubject[1]+scoreSubject[2]
                avg = Double(tot)/3
//                lblResult.text = "세 과목의 총점은 \(tot)입니다.\n 세 과목의 평균점수는 \(avg)입니다. \n 국어는 \(scoreSubject[0]) 점이고 수학은 \(scoreSubject[1]) 점이고 영어는 \(scoreSubject[2])점입니다."
                lblResult.text = """
                    세 과목의 총점은 \(tot)입니다.\n 세 과목의 평균점수는 \(avg)입니다.
                    """

                result3(text:"국어" , scoreSubject:scoreSubject[0])
                result3(text:"수학",  scoreSubject:scoreSubject[1])
                result3(text: "영어", scoreSubject:scoreSubject[2])
            }else{}

        }else{
           
        }
        
}
   
    func result3(text:String, scoreSubject:Int) ->Bool {
        if (scoreSubject) > Int(avg){
            lblResult.text = "\n \(text) 점수는 평균점수보다 높습니다."
        }else if scoreSubject == Int(avg){
            lblResult.text = "\n \(text) 점수는 평균점수와 같습니다."
        }else if scoreSubject < Int(avg){
            lblResult.text = "\n \(text) 점수는 평균점수보다 낮습니다."
        }else {
            
        }
       // return result3(_ text:subject,_ scoreSubject: scoreSubject)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}//-------
   


