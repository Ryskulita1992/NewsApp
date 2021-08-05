//
//  File.swift
//  NewsApp
//
//  Created by admin on 04.08.2021.
//

import Foundation
import UIKit
import SnapKit

class HomeView: UIView {
    
    lazy var container: UIView = {
        let container = UIView()
        container.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        return container}()
    
    lazy var txt: UILabel = {
        let txt = UILabel()
        txt.text = "Discover Trending and latest News"
        txt.font = .systemFont(ofSize: 30, weight: UIFont.Weight(rawValue: -0.5))
        txt.numberOfLines = 0
        txt.textColor = .white
        return txt}()
    
    lazy var txt_small: UILabel = {
        let txt = UILabel()
        txt.text = "Discover your news with easy play"
        txt.font = .systemFont(ofSize: 20, weight: UIFont.Weight(rawValue: -0.6))
        txt.textColor = .white
        return txt}()
    
  
    lazy  var  generalColView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView (frame: .zero, collectionViewLayout: layout)
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        addSubview(container)
        addSubview(txt)
        addSubview(txt_small)
        addSubview(generalColView)
        self.generalColView.register(CellGeneral.self, forCellWithReuseIdentifier: "TypesCellGeneral12345")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        container.snp.makeConstraints{make in
            make.top.equalTo(self)
            make.leading.trailing.equalTo(self)
            make.height.equalTo(self.frame.height/3.7)
        }
        container.layer.cornerRadius = 30
        container.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        txt.snp.makeConstraints{make in
            make.centerY.equalTo(container)
            make.left.equalTo(container).offset(18)
        }
        txt_small.snp.makeConstraints{make in
            make.top.equalTo(txt.snp.bottom).offset(20)
            make.left.equalTo(container).offset(18)
        }
     
        generalColView.snp.makeConstraints{make in
            make.top.equalTo(container.snp.bottom).offset(20)
            make.left.equalTo(self)
            make.right.equalTo(self).offset(-10)
            make.bottom.equalTo(self).offset(-60)
        
        }
        

    }
}
