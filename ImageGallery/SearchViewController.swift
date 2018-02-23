//
//  ViewController.swift
//  ImageGallery
//
//  Created by DavidTran on 2/23/18.
//  Copyright © 2018 DavidTran. All rights reserved.
//

import UIKit
import PromiseKit

class SearchViewController: UIViewController {
  
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    @IBOutlet weak var searchBar: UISearchBar!
    var imageURLs = [URL]()
    var selectedImage:UIImage?
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self
        //hideKeyboardWhenNotUsed()
        
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        //layout.itemSize = CGSize(width: screenWidth/3, height: screenWidth/3)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        imageCollectionView!.collectionViewLayout = layout
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return false
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "imageViewerSegue"{
            if let destinationVC = segue.destination as? ImageViewerViewController{
                destinationVC.image = selectedImage
            }
            
        }
    }
}
// Define functions of Searchbar
extension SearchViewController:UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        imageCollectionView.isHidden = true
        let keyword = searchBar.text!
        firstly {
            ServiceManager.shared.searchImage(with: keyword,count: 50)
        }
        .then{ urls -> Void in
            for url in urls{
                print("\(url)")
            }
            self.imageURLs = urls
            self.imageCollectionView.reloadData()
            self.imageCollectionView.isHidden = false
            
        }
    }
 
}
// Define functions of UICollectionview
extension SearchViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        if indexPath.row == 0
        {
            return CGSize(width: screenWidth, height: screenWidth/3)
        }
        return CGSize(width: screenWidth/3, height: screenWidth/3);

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCollectionViewCell
        cell.configure(imageURL: imageURLs[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("cell \(indexPath.item) selected")
        let selectedCell = collectionView.cellForItem(at: indexPath) as! ImageCollectionViewCell
        selectedImage = selectedCell.imageView.image
        performSegue(withIdentifier: "imageViewerSegue", sender: nil)
    }
    
}
extension SearchViewController:UIScrollViewDelegate{
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        dismissKeyboard()
    }
    // Hide Keyboard Function when click on view
//    func hideKeyboardWhenNotUsed(){
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
//        view.addGestureRecognizer(tap)
//    }
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
