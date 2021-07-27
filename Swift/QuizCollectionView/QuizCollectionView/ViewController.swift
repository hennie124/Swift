//
//  ViewController.swift
//  QuizCollectionView
//
//  Created by 임현진 on 2021/07/26.
//

import UIKit

var item = ["flower_01.png","flower_02.png","flower_03.png","flower_04.png","flower_05.png","flower_06.png"]

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }


}//ViewController

extension ViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    //cell의 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.count
    }
    
    //cell 구성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CollectionViewCell
        cell.imgView.image = UIImage(named: item[indexPath.row])
       return cell
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgDetail"{
            let cell = sender as! CollectionViewCell
            let indexPath = self.collectionView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            detailView.receiveItems(item[indexPath!.row])
        }
    }
}
//ViewController
//Cell Layout 정의
extension ViewController:UICollectionViewDelegateFlowLayout{
    
    //위 아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    //옆 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    //cell의 사이즈(옆 라인을 고려하여 설정)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        //3등분하여 배치, 옆 간격이 1이므로 1을 빼준다.
        let width = collectionView.frame.width / 3 - 1
        let size  = CGSize(width: width, height: width)
        return size
        
    }
}

