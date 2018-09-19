//
//  CardCell.swift
//  DiscoverMusic
//
//  Created by Shashwat Singh on 9/16/18.
//  Copyright © 2018 Shashwat Singh. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell {
    
    let frontCardView: UIView = {
        let frontCardView = UIView()
        frontCardView.backgroundColor = UIColor(red:0.40, green:0.39, blue:0.39, alpha:1.0)
        frontCardView.translatesAutoresizingMaskIntoConstraints = false
        frontCardView.layer.cornerRadius = 10
        frontCardView.isHidden = false
        return frontCardView
    }()
    
    
    let backCardView: UIView  = {
        let backCardView = UIView()
        backCardView.backgroundColor = UIColor(red:0.60, green:0.55, blue:0.55, alpha:1.0)
        backCardView.translatesAutoresizingMaskIntoConstraints = false
        backCardView.layer.cornerRadius = 10
        backCardView.isHidden = false
        return backCardView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red:0.15, green:0.16, blue:0.18, alpha:1.0)
        
        addSubview(backCardView)
        backCardView.topAnchor.constraint(equalTo: self.topAnchor, constant: 80).isActive = true
        backCardView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        backCardView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        backCardView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -160).isActive = true
        
        
        addSubview(frontCardView)
        frontCardView.topAnchor.constraint(equalTo: self.topAnchor, constant: 80).isActive = true
        frontCardView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        frontCardView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        frontCardView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -160).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
