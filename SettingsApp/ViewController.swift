//
//  ViewController.swift
//  SettingsApp
//
//  Created by Kazhymurat on 22.02.2022.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupNavigation()
    }

    func setupNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.title = "Настройки"
    }
}

