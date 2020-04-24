//
//  book1.swift
//  bb
//
//  Created by hathaitat on 10/2/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit

class book1: UITableViewCell {
    
    
    @IBOutlet weak var doctorImage1: UIImageView!
    @IBOutlet weak var doctorName1: UILabel!
    @IBOutlet weak var doctorDept1: UILabel!
    @IBOutlet weak var view111: UIView!
    
    func setImage(){
            doctorImage1.layer.cornerRadius = doctorImage1.frame.size.width / 2
            doctorImage1.clipsToBounds = true
        }
    func shadow(){
        view111.layer.shadowColor = UIColor.gray.cgColor
        view111.layer.shadowOpacity = 1
        view111.layer.shadowOffset = .zero
        view111.layer.shadowRadius = 2
        view111.layer.cornerRadius = 10
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        shadow()
        setImage()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
