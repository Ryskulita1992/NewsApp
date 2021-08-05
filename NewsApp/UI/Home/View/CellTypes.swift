//
//  CellTypes.swift
//  NewsApp
//
//  Created by admin on 04.08.2021.
//

import Foundation
import UIKit
import Kingfisher

class CellGeneral: UICollectionViewCell {
    override var reuseIdentifier: String? {
        return "TypesCellGeneral12345"
    }
 
    lazy var icon :  UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 50))
        image.layer.cornerRadius = self.frame.height/9
        image.clipsToBounds = true
        return image
    }()
    lazy var title: UILabel = {
        let lbl = UILabel ()
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 15)
        lbl.sizeToFit()
        return lbl
    }()
    
    override init (frame: CGRect){
        super.init(frame: frame)
        contentView.addSubview(icon)
        contentView.addSubview(title)

    }

    required init?(coder: NSCoder) {
        fatalError("")
    }
    override func layoutSubviews() {
        icon.snp.makeConstraints{make in
            make.left.equalTo(contentView).offset(18)
            make.right.equalTo(contentView).offset(-230)
            make.top.bottom.equalTo(contentView).inset(10)

        }
        title.snp.makeConstraints{make in
            make.left.equalTo(icon.snp.right).offset(20)
            make.top.equalTo(contentView).offset(20)
            make.right.equalTo(contentView).offset(-10)
        }
        
        
    }
    public func fillData(with news: Article) {
        title.text = news.title
        if let urlString = news.urlToImage {
            let urlImage = URL(string: urlString)
            icon.kf.setImage(with: urlImage)
            
        }
    
    }
        

}
