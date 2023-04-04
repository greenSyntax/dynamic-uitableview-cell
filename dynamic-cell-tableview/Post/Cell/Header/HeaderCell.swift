//
//  HeaderCell.swift
//  dynamic-cell-tableview
//
//  Created by Abhishek Ravi on 04/04/23.
//

import UIKit

class HeaderCell: UITableViewCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func intialize(_ data: HeaderCellData) {
        self.labelTitle.text = data.title
        self.labelDescription.text = "\(data.author) • \(data.timestamp)"
    }
    
}
