//
//  QueryModel.swift
//  DBCRUD
//
//  Created by 임현진 on 2021/07/28.
//

import Foundation
protocol QueryModelProtocol{
    func itemDownloaded(items: NSArray)
}

class QueryModel: NSObject {
    var delegate: QueryModelProtocol!
    let urlPath = "http://192.168.2.54:8080/ios/student_query_ios.jsp"
    func downloadItems() {
        print(10)
        let url: URL = URL(string: urlPath)!
//        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default) --> Foundation 써도 되고 안 써도 됨
        let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil {
                print("Failed to download data")
                print(11)
            }else {
                print("Data is downloaded")
                self.parseJSON(data!)
                print(12)
            }
        }
        task.resume() //위에 있는 것은 task의 실행을 하기 위해 정의 된 것이다. task는 data,response,error 세 가지를 가진다.
    }
    
    func parseJSON(_ data: Data) {
        print(13)
        var jsonResult = NSArray()
        do {
            print(14)
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            print(jsonResult)
        } catch let error as NSError {
            print(error)
        } //에러를 잡기 위해 do try catch문을 쓴다.
        
        //제이슨 안에 있는 데이터를 가져온다.
        var jsonElement = NSDictionary()
        print(15)
        //데이터를 넣고 빼고를 할 수 있게 할 수 있도록 Array를 넣음
        let locations = NSMutableArray()
        print(16)
        
        //제이슨 테이블 배열이 2개이므로 jsonResult는 두번 돌아간다.
        for i in 0..<jsonResult.count{
            print(17)
            jsonElement = jsonResult[i] as! NSDictionary
            //String으로 바꾸는 것이 편해서 Default로 지정해놓음
            if let scode = jsonElement["code"] as? String,
               let sname = jsonElement["name"] as? String,
               let sdept = jsonElement["dept"] as? String,
               let sphone = jsonElement["phone"] as? String{
                let query = DBModel(scode: scode, sname: sname, sdept: sdept, sphone: sphone)
                locations.add(query)
                print(query)
            }
        }
        //TableViewController에서 다른 일을 하고 있으면 여기서 async를 이용하여 table이 실행 될 때 같이 실행되도록 한다.
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemDownloaded(items: locations)
            print(18)
        })
    }
}
