//
//  appiontmentTableViewCell.swift
//  bb
//
//  Created by hathaitat on 28/2/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit

class appiontmentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var showNameDoc: UILabel!
    @IBOutlet weak var showDeptDoc: UILabel!
    @IBOutlet weak var showDayApp: UITextView!
    @IBOutlet weak var showTimeApp: UILabel!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    func shadow(){
        
        view1.layer.cornerRadius = 8
        view2.layer.cornerRadius = 8
        
        view2.layer.shadowColor = UIColor.gray.cgColor
        view2.layer.shadowOpacity = 1
        view2.layer.shadowOffset = .zero
        view2.layer.shadowRadius = 2
        
        view1.layer.shadowColor = UIColor.gray.cgColor
        view1.layer.shadowOpacity = 1
        view1.layer.shadowOffset = .zero
        view1.layer.shadowRadius = 2
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        view1.layer.cornerRadius = 8
        view2.layer.cornerRadius = 8
        shadow()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
