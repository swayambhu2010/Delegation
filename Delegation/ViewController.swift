//
//  ViewController.swift
//  Delegation
//
//  Created by Swayambhu BANERJEE on 22/03/26.
//

import UIKit

class ViewController: UIViewController, DisplayColorDelegate {

    @IBOutlet weak var displayView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func showListView(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "ColorListViewController") as? ColorListViewController else { return }
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func sendColor(color: UIColor) {
        displayView.backgroundColor = color
    }
}

