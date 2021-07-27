//
//  DetailViewController.swift
//  QuizTable
//
//  Created by 임현진 on 2021/07/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var ImgView: UIImageView!
    @IBOutlet weak var lblItem: UILabel!
    var receiveItem = ""
    var receiveItemImage = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        lblItem.text = receiveItem
        ImgView.image = UIImage(named: receiveItemImage)
        // Do any additional setup after loading the view.
    }
    
    func receiveItems(_ item:String, _ image: String){
        receiveItem = item
        receiveItemImage = image
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


