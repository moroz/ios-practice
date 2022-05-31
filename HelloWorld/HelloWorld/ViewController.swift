//
//  ViewController.swift
//  HelloWorld
//
//  Created by Karol Moroz on 25/05/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showMessage(sender: UIButton) {
        let alertController = UIAlertController(
            title: "Welcome to My First App",
            message: "Hello world",
            preferredStyle: .alert
        )
        alertController.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

