//
//  MainColorViewController.swift
//  ColorizedApp
//
//  Created by Paul Makey on 13.12.23.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func setViewColor(with color: UIColor)
}

final class MainColorViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navVC = segue.destination as? UINavigationController else { return }
        guard let settingsVC = navVC.topViewController as? SettingsViewController else { return }
        
        settingsVC.delegate = self
        settingsVC.color = view.backgroundColor
    }
}

// MARK: - SettingsViewControllerDelegate
extension MainColorViewController: SettingsViewControllerDelegate {
    func setViewColor(with color: UIColor) {
        view.backgroundColor = color
    }
}
