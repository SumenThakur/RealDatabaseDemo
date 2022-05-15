//
//  PersonCell.swift
//  RealmDemo
//
//  Created by Sumendra on 15/05/22.
//

import UIKit

class PersonCell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDepartment: UILabel!
    @IBOutlet weak var lblId: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func SetCellData(data:Person){
        lblName?.text = data.name
        lblDepartment?.text = data.department
        lblId?.text = data.id
    }
    

}
