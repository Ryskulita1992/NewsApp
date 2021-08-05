//
//  DetailedViewController.swift
//  NewsApp
//
//  Created by admin on 05.08.2021.
//

import Foundation
import UIKit
import Kingfisher

class DetailedViewController: UIViewController {
    var url: String?
    var titleOfNews : String?
    var image : String?
    var publication : String?
    var link : String?
    
    
    private func view()-> Detailed_View {
        return self.view as! Detailed_View
    }
    override func loadView() {
        self.view = Detailed_View()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        fillData()
        
        
    }
    public func fillData() {
        view().title.text = titleOfNews
        view().publication.text = publication
        view().descriptionTitle.text = url
        view().link.setTitle(link, for: .normal)
        
        if let urlString = image {
            let urlImage = URL(string: urlString)
            view().icon.kf.setImage(with: urlImage)
        } else if image == "" {
            view().icon.image = UIImage(named: "newspaper")

        }
        view().link.addTarget(self, action: #selector(linkTapped), for: .touchUpInside)
        
    }
    @objc func linkTapped(){
        let viewController = FollowLinkViewController()
        viewController.link = link
        navigationController?.pushViewController(viewController, animated: false)
    }
    
}

