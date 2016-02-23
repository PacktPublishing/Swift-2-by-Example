//
//  CardCell.swift
//  Memory
//
//  Created by Giordano Scalzo on 18/11/2014.
//  Copyright (c) 2014 Swift by Example. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell {
    private let frontImageView: UIImageView!
    private var cardImageName: String!
    private var backImageName: String!
    
    override init(frame: CGRect) {
        
        frontImageView = UIImageView(frame: CGRect(origin: CGPointZero, size: frame.size))
        super.init(frame: frame)
        contentView.addSubview(frontImageView)
        contentView.backgroundColor = UIColor.clearColor()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func renderCardName(cardImageName: String, backImageName: String){
        self.cardImageName = cardImageName
        self.backImageName = backImageName
        frontImageView.image = UIImage(named: self.backImageName)
    }
    
    func upturn() {
        UIView.transitionWithView(contentView,
            duration: 1,
            options: .TransitionFlipFromRight,
            animations: {
                self.frontImageView.image = UIImage(named: self.cardImageName)
            },
            completion: nil)
    }

    func downturn() {
        UIView.transitionWithView(contentView,
            duration: 1,
            options: .TransitionFlipFromLeft,
            animations: {
                self.frontImageView.image = UIImage(named: self.backImageName)
            },
            completion: nil)
    }

    func remove() {
        UIView.animateWithDuration(1,
            animations: {
                self.alpha = 0
            },
            completion: { completed in
                self.hidden = true
        })
    }

}
