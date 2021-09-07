//
//  UIViewController+Ext.swift
//  MyRides
//
//  Created by Marco Espinoza on 8/16/21.
//

import UIKit

extension UIViewController {
    
    func presentRidesAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = RidesAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
