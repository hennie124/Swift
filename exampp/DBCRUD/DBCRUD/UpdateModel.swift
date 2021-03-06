//
//  UpdateModel.swift
//  DBCRUD
//
//  Created by 임현진 on 2021/07/28.
//

import Foundation
class UpdateModel{
    var urlPath = "http://192.168.2.101:8080/ios/studentUpdate_ios.jsp"
    func UpdateItems(code:String,name:String,dept:String,phone:String)  -> Bool{
        
        var result: Bool = true
        let urlAddr = "?name=\(name)&dept=\(dept)&phone=\(phone)&code=\(code)"
        urlPath = urlPath + urlAddr
        print(urlPath)
     
        //한글 url encoding
        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let url: URL = URL(string: urlPath)!
        let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil {
                print("Failed to download data")
                result = false
            }else {
                print("Data is downloaded")
                result = false
            }
            
        }
        task.resume() //위에 있는 것은 task의 실행을 하기 위해 정의 된 것이다. task는 data,response,error 세 가지를 가진다.
        return result
    }
}
