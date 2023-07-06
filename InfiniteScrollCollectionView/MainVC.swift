//
//  PageControlVC.swift
//
//  Created by Bhumita Panara on 03/07/23.
//

import UIKit
import Foundation

class MainVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate{

    //MARK: - OUTLETS
    @IBOutlet weak var colVw: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    //MARK: - GLOBAL VARIABLES
    var imageArray = ["place_canada","place_costa_rica","place_germany","place_greece","place_india"]
    var frame = CGFloat(0)
    
    //MARK: - UI VIEW CONTROLLER LIFE CYCLES
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = imageArray.count
    }

    //MARK: - DELEGATE METHODS
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DetailCollectionViewCell
        cell.imgView.image = UIImage(named: imageArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width, height: 250)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x/scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
        if pageControl.currentPage == 1{
            frame = pageNumber
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if pageControl.currentPage == imageArray.count - 1{
            pageControl.currentPage = 0
            colVw.contentOffset = CGPoint(x: 0, y: 0)
        }
    }
}
