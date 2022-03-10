//
//  SkillTableViewCell.swift
//  PokeDex
//
//  Created by NewMac on 2/24/22.
//

import UIKit

class SkillTableViewCell: UITableViewCell {

    //MARK : Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func prepareCell(skill: SkillModal) {
        self.titleLabel.text = skill.name
        self.levelLabel.text = String(skill.level)
        self.slider.value = Float(skill.level) / 100
        self.slider.minimumTrackTintColor = Colors.colorList[skill.type]
    }
}
