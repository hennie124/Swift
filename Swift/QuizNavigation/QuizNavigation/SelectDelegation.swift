//
//  SelectDelegation.swift
//  QuizNavigation
//
//  Created by 임현진 on 2021/07/22.
//

import Foundation

protocol SelectDelegate {
    func didImageOnOffDone(_ controller:SelectViewController,isOn:Bool,isRed:Bool)
}
