//
//  EditDelegate.swift
//  Navigation
//
//  Created by 임현진 on 2021/07/22.
//

import Foundation

//interface 프로토콜은 규약이기 때문에 이름만 저장할 수 있다!
protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller:EditViewController,isOn:Bool)
}
