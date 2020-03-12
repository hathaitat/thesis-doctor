//
//  book2.swift
//  bb
//
//  Created by hathaitat on 23/1/2563 BE.
//  Copyright © 2563 hathaitat. All rights reserved.
//

import UIKit

class book2: UITableViewCell {

    
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var doctorImage: UIImageView!
    @IBOutlet weak var doctorName: UILabel!
    @IBOutlet weak var doctorDept: UILabel!
    @IBOutlet weak var doctorBtn: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
//class DoctorData {
//        var nameDoc : String
//        var deptdoc : String
////        var style : String
////        var area_en : String
////        var area_th : String
////        var imageURL : String
//
//        init(nameDoc: String, deptdoc: String) {
//            self.nameDoc = nameDoc
//            self.deptdoc = deptdoc
////            self.style = style
////            self.area_en = area_en
////            self.area_th = area_th
////            self.imageURL = imageURL
//        }
//    }
