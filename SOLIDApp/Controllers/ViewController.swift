//
//  ViewController.swift
//  SOLIDApp
//
//  Created by Martynov Evgeny on 16.05.22.
//

import UIKit

class ViewController: BaseViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var nameTF: UITextField!
    
    let dataFetcherService: DataFetcherServiceProtocol = DataFetcherService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveBtn.layer.cornerRadius = saveBtn.frame.width / 2
        
//        dataFetcherService.fetchFreeGames() { appGroup in
//            print(appGroup)
//        }
//        dataFetcherService.fetchPaidGames() { appGroup in
//            print(appGroup)
//        }
        dataFetcherService.fetchCountry() { countries in
            print(countries)
        }
        
        dataFetcherService.fetchLocalCountry() { countries in
            print(countries)
        }
    }

    @IBAction func saveBtnAction() {
        saveName()
    }
    
    @IBAction func emailTFChanged() {
        guard let text = emailTF.text else { return }
        let isValid = ValidateService.isValidEmail(text)
        saveBtn.isEnabled = isValid
        textLabel.text = isValid ? "" : "Error email"
    }
    
    // MARK: - Private func-s
    
    private func saveName() {
        if let name = nameTF.text, name.count != 0 {
            DataStore.shared.saveName(name: name)
        } else {
            showAlert(with: "Error", message: "Name empty")
        }
    }
}



