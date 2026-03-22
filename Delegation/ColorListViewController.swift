//
//  ColorListViewController.swift
//  Delegation
//
//  Created by Swayambhu BANERJEE on 22/03/26.
//

import UIKit

protocol DisplayColorDelegate: AnyObject {
    func sendColor(color: UIColor)
}

class ColorListViewController: UIViewController {

    @IBOutlet weak var colorListTableView: UITableView!
    
    var colors: [ColorsDataSource] = []
    weak var delegate: DisplayColorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewSetup()
        colorsDataSource()
    }
    
    func tableViewSetup() {
        colorListTableView.dataSource = self
        colorListTableView.delegate = self
        let nib = UINib(nibName: "ColorListTableViewCell", bundle: nil)
        colorListTableView.register(nib, forCellReuseIdentifier: ColorListTableViewCell.identifier)
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
        cell.configure(with: color.color)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedColor = colors[indexPath.row].color
        delegate?.sendColor(color: selectedColor)
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
