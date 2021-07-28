//
//  TableViewCell.swift
//  ServerJson_03
//
//  Created by 임현진 on 2021/07/28.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    
   
    
    func ImgShow(){
        let url = URL(string: "http://192.168.2.101:8080/ios/clock.png")
        let data = try? Data(contentsOf: url!)
        imgView.image = UIImage(data: data!)
    }
   
}
