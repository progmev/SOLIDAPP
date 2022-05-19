//
//  BaseViewController.swift
//  SOLIDApp
//
//  Created by Martynov Evgeny on 16.05.22.
//

import UIKit

class BaseViewController: UIViewController {
    func showAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
        self.present(alert, animated: true)
    }
}
