//
//  JsonModel.swift
//  ServerJson_02
//
//  Created by 임현진 on 2021/07/28.
//

import Foundation
protocol JsonModelProtocol{
    func itemDownloaded(items: NSArray)
}


class JsonModel: NSObject {
    var delegate: JsonModelProtocol!
    let urlPath = "http://192.168.2.101:8080/ios/student.json"
    
    func downloadItems() {
        let url: URL = URL(string: urlPath)!
//        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default) --> Foundation 써도 되고 안 써도 됨
        let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil {
                print("Failed to download data")
            }else {
                print("Data is downloaded")
                self.parseJSON(data!)
            }
        }
        task.resume() //위에 있는 것은 task의 실행을 하기 위해 정의 된 것이다. task는 data,response,error 세 가지를 가진다.
    }
    
    func parseJSON(_ data: Data) {
        var jsonResult = NSArray()
        do {
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
        } catch let error as NSError {
            print(error)
        } //에러를 잡기 위해 do try catch문을 쓴다.
        
        //제이슨 안에 있는 데이터를 가져온다.
        var jsonElement = NSDictionary()
        //데이터를 넣고 빼고를 할 수 있게 할 수 있도록 Array를 넣음
        let locations = NSMutableArray()
        
        //제이슨 테이블 배열이 2개이므로 jsonResult는 두번 돌아간다.
        for i in 0..<jsonResult.count{
            jsonElement = jsonResult[i] as! NSDictionary
            //String으로 바꾸는 것이 편해서 Default로 지정해놓음
            if let scode = jsonElement["code"] as? String,
               let sname = jsonElement["name"] as? String,
               let sdept = jsonElement["dept"] as? String,
               let sphone = jsonElement["phone"] as? String{
                let query = DBModel(scode: scode, sname: sname, sdept: sdept, sphone: sphone)
                locations.add(query)
            }
        }
        //TableViewController에서 다른 일을 하고 있으면 여기서 async를 이용하여 table이 실행 될 때 같이 실행되도록 한다.
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemDownloaded(items: locations)
        })
    }
}


