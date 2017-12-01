//
//  PasswordLoginViewController.swift
//  SmileLock-Example
//
//  Created by rain on 4/22/16.
//  Copyright © 2016 RECRUIT LIFESTYLE CO., LTD. All rights reserved.
//

import UIKit
import SmileLock

class PasswordLoginViewController: UIViewController {

    @IBOutlet weak var passwordStackView: UIStackView!
    
    //MARK: Property
    var passwordContainerView: PasswordContainerView!
    let kPasswordDigit = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create PasswordContainerView
        passwordContainerView = PasswordContainerView.create(in: passwordStackView, digit: 4)
        passwordContainerView.delegate = self
        passwordContainerView.dotToInputSpacing = 48
        passwordContainerView.fontSizeRatio = 32 / 40
        
        passwordContainerView.deleteButtonLocalizedTitle = "smilelock_delete"
        
        //customize password UI
        passwordContainerView.tintColor = UIColor.color(.green)
        passwordContainerView.dotTintColor = UIColor.blue
        passwordContainerView.highlightedColor = UIColor.color(.green)
        passwordContainerView.textColor = UIColor.color(.textColor)
        let image = #imageLiteral(resourceName: "deleteButton")
        
        passwordContainerView.setDeleteButton(image: image)
        
    }
}

extension PasswordLoginViewController: PasswordInputCompleteProtocol {
    func passwordInputComplete(_ passwordContainerView: PasswordContainerView, input: String) {
        if validation(input) {
            validationSuccess()
        } else {
            validationFail()
        }
    }
    
    func touchAuthenticationComplete(_ passwordContainerView: PasswordContainerView, success: Bool, error: Error?) {
        if success {
            self.validationSuccess()
        } else {
            passwordContainerView.clearInput()
        }
    }
}

private extension PasswordLoginViewController {
    func validation(_ input: String) -> Bool {
        return input == "1111"
    }
    
    func validationSuccess() {
        print("*️⃣ success!")
        dismiss(animated: true, completion: nil)
    }
    
    func validationFail() {
        print("*️⃣ failure!")
        passwordContainerView.wrongPassword()
    }
}
