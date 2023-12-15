//
//  SettingsViewController.swift
//  ColorizedApp
//
//  Created by Paul Makey on 13.12.23.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    // MARK: - Properties
    unowned var delegate: SettingsViewControllerDelegate!
    var color: UIColor!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        
        colorView.layer.cornerRadius = 15
        colorView.backgroundColor = color
        
        setValue(for: redSlider, greenSlider, blueSlider)
        setValue(for: redValueLabel, greenValueLabel, blueValueLabel)
    }
    
    // MARK: - IB Action
    @IBAction func sliderValueDidChanged(_ sender: UISlider) {
        switch sender {
            case redSlider: redValueLabel.text = string(from: sender.value)
            case greenSlider: greenValueLabel.text = string(from: sender.value)
            default: blueValueLabel.text = string(from: sender.value)
        }
        updateUI()
    }
    
    @IBAction private func saveButtonDidTapped(_ sender: UIBarButtonItem) {
        delegate?.setViewColor(with: colorView.backgroundColor ?? .black)
        dismiss(animated: true)
    }
    
}

// MARK: - Private Methods
private extension SettingsViewController {
    func updateUI() {
        redValueLabel.text = string(from: redSlider.value)
        greenValueLabel.text = string(from: greenSlider.value)
        blueValueLabel.text = string(from: blueSlider.value)
        
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    func setValue(for sliders: UISlider...) {
        let ciColor = CIColor(color: color)
        sliders.forEach { slider in
            switch slider {
                case redSlider: redSlider.value = Float(ciColor.red)
                case greenSlider: greenSlider.value = Float(ciColor.green)
                default: blueSlider.value = Float(ciColor.blue)
            }
        }
    }
    
    func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
                case redValueLabel: label.text = string(from: redSlider.value)
                case greenValueLabel: label.text = string(from: greenSlider.value)
                default: label.text = string(from: blueSlider.value)
            }
        }
    }
    
    func string(from float: Float) -> String {
        String(format: "%.2f", float)
    }
}
