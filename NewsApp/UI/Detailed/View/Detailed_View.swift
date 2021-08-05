//
//  Detailed_View.swift
//  NewsApp
//
//  Created by admin on 05.08.2021.
//

import Foundation
import UIKit
import SnapKit

class Detailed_View: UIView {
    
    
    lazy var icon :  UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        return image
    }()
    
    lazy var title: UILabel = {
        let txt = UILabel()
        txt.font = .systemFont(ofSize: 20)
        txt.numberOfLines = 0
        txt.textColor = .black
        return txt}()
    
    lazy var publication: UILabel = {
        let txt = UILabel()
        txt.numberOfLines = 0
        txt.font = .systemFont(ofSize: 20, weight: UIFont.Weight(rawValue: -0.6))
        txt.textColor =  #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        return txt}()
    
    lazy var descriptionTitle : UILabel = {
        let txt = UILabel()
        txt.numberOfLines = 0
        txt.font = .systemFont(ofSize: 20, weight: UIFont.Weight(rawValue: -0.6))
        txt.textColor =  #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        return txt}()
    
    lazy var link: UIButton = {
        let buttonAllMasters = UIButton()
        buttonAllMasters.setTitleColor(.systemBlue, for: .normal)
        return buttonAllMasters
    }()
    override init(frame:CGRect){
        super.init(frame: frame)
        addSubview(icon)
        addSubview(title)
        addSubview(publication)
        addSubview(descriptionTitle)
        addSubview(link)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        
        icon.snp.makeConstraints{make in
            make.top.equalTo(self)
            make.left.right.equalTo(self)
            make.height.equalTo(self.frame.height/2.5)
        }
        icon.layer.cornerRadius = 30
        icon.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        title.snp.makeConstraints{ make in
            make.top.equalTo(icon.snp.bottom).offset(15)
            make.left.equalTo(self).offset(8)
            make.right.equalTo(self).offset(-20)
            
        }
        publication.snp.makeConstraints{ make in
            make.top.equalTo(title.snp.bottom).offset(10)
            make.left.equalTo(self).offset(8)
        }
        descriptionTitle.snp.makeConstraints{ make in
            make.top.equalTo(publication.snp.bottom).offset(25)
            make.left.right.equalTo(self).inset(8)
        }
        link.snp.makeConstraints{ make in
            make.top.equalTo(descriptionTitle.snp.bottom).offset(25)
            make.left.right.equalTo(self).inset(8)
        }
        
        
    }
}
