//
//  ViewController.swift
//  QuizMapPageControl
//
//  Created by 임현진 on 2021/07/23.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var pageControl: UIPageControl!
    var castle = ["혜화문","흥인지문","창의문","숙정문"]
    let myLoc = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        myLoc.delegate = self
        myLoc.requestWhenInUseAuthorization()//승인 허용 문구 받아서 처리
        myLoc.startUpdatingLocation() //GPS 좌표 받기 시작
        map.showsUserLocation = true //User의 위치를 보여주는 것
        
        pageControl.numberOfPages = castle.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.darkGray
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        var coon = pageControl.currentPage
        lblLocation.text = castle[pageControl.currentPage]
        pageChangeLocation(coon)
    }
        
    func pageChangeLocation(_ con:Int) {
        // func "func명"(_ "변수명" : "변수타입") {}
        //coon을 받아서 여기 있는 con이라는 변수로 막 쓰기만 한다. 
        if con == 0 {
            mapMove(37.5878892, 127.0037098)
        }else if con == 1{
            mapMove(37.5711907, 127.009506)
        }else if con == 2{
            mapMove(37.5926027, 127.9664771)
        }else if con == 3{
            mapMove(37.5926027, 127.9810576)
        }
    }
    
    
    func mapMove(_ lat:CLLocationDegrees, _ lon:CLLocationDegrees){
        let pLoc = CLLocationCoordinate2DMake(lat, lon)
        //배율
        let pSpan = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        
        //좌표 정보
        let pRegion = MKCoordinateRegion(center: pLoc, span: pSpan)
        
        //현재 지도를 좌표정보로 보이기
        map.setRegion(pRegion, animated: true)
        
        let addrLoc = CLLocation(latitude: lat, longitude: lon)
        var txt2 = ""
        
        CLGeocoder().reverseGeocodeLocation(addrLoc,completionHandler:{place,error in
            let pm = place!.first
            txt2 = pm!.country! //국가
            txt2 += " " + pm!.locality! //시,도
            txt2 += " " + pm!.thoroughfare! //동
           
            
        })
        setPoint(pLoc)
    }
    
        func setPoint(_ loc: CLLocationCoordinate2D) {
            let pin = MKPointAnnotation()
            pin.coordinate = loc
            
            map.addAnnotation(pin)
        }
        
    }//ViewController

//myLoc = CLLocationManager()가 호출시 자동 실행
extension ViewController:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lastLoc = locations.last
        //지도 보기
        mapMove((lastLoc?.coordinate.latitude)!, (lastLoc?.coordinate.longitude)!)
        myLoc.stopUpdatingLocation()
        
    }
}


