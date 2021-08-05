//
//  HomeViewModel.swift
//  NewsApp
//
//  Created by admin on 05.08.2021.
//

import Foundation

protocol  HomeDelegate : class{
    func loadNews(news: [Article])
    func showError(string: String)
}

class HomeViewModel {
    
    private weak var delegate: HomeDelegate? = nil
    private lazy var repo: ApiClient = {
        return ApiClient()
    }()
      
    init(delegate: HomeDelegate) {
        self.delegate = delegate
    }
    
    func getNews(){
        print("viewmodel")
        repo.getNews { (result) in
            switch result {
            case .success(let response):
                self.delegate?.loadNews(news: response)
                break
                
            case .failure(let error):
                self.delegate?.showError(string: error.localizedDescription)
                break
            }
        }
    }
    
    
}
