//
//  SetRepsTableViewCell.swift
//  Myo Gainz
//
//  Created by Matthew Dias on 2016-01-24.
//  Copyright © 2016 Myo Something. All rights reserved.
//

import UIKit

class SetRepsTableViewCell: UITableViewCell {

    @IBOutlet weak var exerciseName: UILabel!
    @IBOutlet weak var numberOfSets: UILabel!
    @IBOutlet weak var setIncrement: UIStepper!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
