//
//  FooterCell.swift
//  dynamic-cell-tableview
//
//  Created by Abhishek Ravi on 04/04/23.
//

import UIKit

class FooterCell: UITableViewCell {
    
    @IBOutlet weak var labelFooterTitle: UILabel!
    @IBOutlet weak var labelFooterDescription: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
 
    func initialize(_ data: FooterCellData) {
        self.labelFooterTitle.text = data.link
    }
}
