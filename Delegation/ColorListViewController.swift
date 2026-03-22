//
//  ColorListViewController.swift
//  Delegation
//
//  Created by Swayambhu BANERJEE on 22/03/26.
//

import UIKit

class ColorListViewController: UIViewController {

    @IBOutlet weak var colorListTableView: UITableView!
    
    var colors: [ColorsDataSource] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewSetup()
        colorsDataSource()
    }
    
    func tableViewSetup() {
        colorListTableView.dataSource = self
        colorListTableView.delegate = self
        colorListTableView.register(ColorListTableViewCell.self,
        forCellReuseIdentifier: ColorListTableViewCell.identifier)
    }
    
    func colorsDataSource() {
        colors = ColorsDataSource.allCases
    }

}

extension ColorListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ColorListTableViewCell.identifier,
            for: indexPath
        ) as? ColorListTableViewCell else {
            return UITableViewCell()
        }
        
        let color = ColorsDataSource.allCases[indexPath.row]
        print("color is \(color)")
        cell.configure(with: color.color)
        
        return cell
    }
    
    
}
