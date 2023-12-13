//
//  SettingsViewController.swift
//  ColorizedApp
//
//  Created by Paul Makey on 13.12.23.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 15
        
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
    }
    
    @IBAction func sliderValueDidChanged(_ sender: UISlider) {
        updateUI()
    }
}

// MARK: - Private Methods
private extension SettingsViewController {
    func updateUI() {
        redValueLabel.text = string(from: redSlider.value)
        greenValueLabel.text = string(from: greenSlider.value)
        blueValueLabel.text = string(from: blueSlider.value)
    }
    
    func string(from float: Float) -> String {
        String(format: "%.2f", float)
    }
}
