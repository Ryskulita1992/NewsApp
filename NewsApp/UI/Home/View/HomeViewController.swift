//
//  ViewController.swift
//  NewsApp
//
//  Created by admin on 04.08.2021.
//

import UIKit

class HomeViewController: BaseViewController  {
    private func view()-> HomeView {
        return self.view as! HomeView
    }
    override func loadView() {
        self.view = HomeView()
    }
    lazy var viewModel: HomeViewModel = {
        return HomeViewModel(delegate: self)
    }()
    var newsResponse : [Article] = []
    var array : [Article] = []


    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
     
        view().generalColView.dataSource = self
        view().generalColView.delegate = self
        viewModel.getNews()
   
    }


}

extension HomeViewController: HomeDelegate{
    func loadNews(news: [Article]) {
        newsResponse.append(contentsOf: news)
        DispatchQueue.main.async{
            self.view().generalColView.reloadData()
        }
    }
    
    func showError(string: String) {
        
    }
}


extension HomeViewController :  UICollectionViewDelegate,  UICollectionViewDelegateFlowLayout, UICollectionViewDataSource  {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsResponse.count
      }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
      {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height/6)
        
      }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cellGener = collectionView.dequeueReusableCell(withReuseIdentifier: "TypesCellGeneral12345", for: indexPath as IndexPath)
            as! CellGeneral
        cellGener.fillData(with: newsResponse[indexPath.row])
        return cellGener
                

      }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = DetailedViewController()
        viewController.url = newsResponse[indexPath.row].articleDescription
        viewController.titleOfNews = newsResponse[indexPath.row].title
        viewController.image = newsResponse[indexPath.row].urlToImage
        viewController.publication = newsResponse[indexPath.row].publishedAt
        viewController.link = newsResponse[indexPath.row].url

        navigationController?.pushViewController(viewController, animated: true)
    }
    
        

        
        
    }
    
    

