//
//  RolesCollectionViewCell.swift
//  mobile_architecture
//
//  Created by Ferdinand on 17/11/20.
//

import UIKit

class RolesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var labelRole: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewBackground.layer.borderColor = UIColor.lightGray.cgColor
        viewBackground.layer.borderWidth = 0.9
        viewBackground.layer.masksToBounds = false
        viewBackground.layer.cornerRadius = 9

        viewBackground.layer.shadowColor = UIColor.black.cgColor
        viewBackground.layer.shadowOpacity = 0.6
        viewBackground.layer.shadowRadius = 3
        viewBackground.layer.shadowOffset = CGSize(width: 3, height: 3)
    }
    
    func didSelect(select: Bool) {
        if select {
            viewBackground.backgroundColor = UIColor.black
            labelRole.textColor = UIColor.white
        }else {
            if #available(iOS 13.0, *) {
                viewBackground.backgroundColor = UIColor.systemGroupedBackground
            } else {
                viewBackground.backgroundColor = UIColor.systemGray
            }
            labelRole.textColor = UIColor.black
        }
    }
    
}
