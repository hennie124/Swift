//
//  ViewController.swift
//  QuizSwipeGesture
//
//  Created by 임현진 on 2021/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var images = ["flower_01.png","flower_02.png","flower_03.png","flower_04.png","flower_05.png","flower_06.png"]
    
    var imgLeft = [UIImage]()
    var imgRight = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = UIImage(named: images[0])
        
//        imgViewLeft.image = imgLeft[0]
//        imgViewRight.image = imgRight[0]
        
        //pageControl
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.darkGray
        
        //한 손가락 Gesture 구성
        makeSingleTouch()
    }

    func makeSingleTouch(){
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.left:
                pageControl.currentPage -= 1
                imgView.image = UIImage(named: images[pageControl.currentPage])
            case UISwipeGestureRecognizer.Direction.right:
                pageControl.currentPage += 1
                imgView.image = UIImage(named: images[ pageControl.currentPage])
            default:
                break
            }
        }
    }
    
    
    
    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
}

