//
//  ViewController.swift
//  Day2Task
//
//  Created by Saltuk Bugra OZELGUL on 19.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var variables = Variables()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "NameCell", bundle: nil), forCellReuseIdentifier: "NameCell")
        tableView.register(UINib(nibName: "CityCell", bundle: nil), forCellReuseIdentifier: "CityCell")
    }
    
    func toggleSelection(_ indexPath: IndexPath) {
        variables.Names[indexPath.row].isSelected = !variables.Names[indexPath.row].isSelected
        tableView.cellForRow(at: indexPath)?.contentView.backgroundColor = variables.Names[indexPath.row].isSelected ? .red : nil
    }
    
    func isAlreadySelected(_ indexPath: IndexPath) -> Bool {
        return variables.Names[indexPath.row].isSelected
    }
    
    func navigateToCityView(_ indexPath: IndexPath) {
        let cityViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CityViewController") as! CityViewController
        
        cityViewController.cityNameString = variables.Cities[indexPath.row]
    
        navigationController?.pushViewController(cityViewController, animated: true)
    }
}

//MARK: - Table View Delegate Functions

extension ViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return variables.NUMBER_OF_SECTIONS
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
            case 0:
            if (isAlreadySelected(indexPath)) {
                // deselect this cell
                tableView.deselectRow(at: indexPath, animated: true)
            }
            toggleSelection(indexPath)
        case 1:
            navigateToCityView(indexPath)
            default:
                break
        }
    
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        switch indexPath.section {
            case 0:
                toggleSelection(indexPath)
            default:
                break
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
                return variables.Names.count
            case 1:
                return variables.Cities.count
            default:
                return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)
            
                cell.contentView.backgroundColor = variables.Names[indexPath.row].isSelected ? .red : nil
                cell.textLabel?.text = variables.Names[indexPath.row].name
                
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)
        
                cell.textLabel?.text = variables.Cities[indexPath.row]
                
                return cell
            default:
                return UITableViewCell()
        }
        
    }
}




