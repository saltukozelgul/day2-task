//
//  CityViewController.swift
//  Day2Task
//
//  Created by Saltuk Bugra OZELGUL on 19.07.2023.
//

import UIKit

class CityViewController: UIViewController {
    
    var cityNameString: String?
    
    
    @IBOutlet weak var cityName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        cityName.text = cityNameString
    
    }
    


}
