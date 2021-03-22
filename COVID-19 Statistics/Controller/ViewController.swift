//
//  ViewController.swift
//  COVID-19 Statistics
//
//  Created by Tushar Khandaker on 3/20/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var newConfirmLabel: UILabel!
    @IBOutlet weak var totalConfirmLabel: UILabel!
    @IBOutlet weak var newDeathLabel: UILabel!
    @IBOutlet weak var totalDeathLabel: UILabel!
    @IBOutlet weak var newRecoverLabel: UILabel!
    @IBOutlet weak var totalRecoverLabel: UILabel!
    @IBOutlet weak var currentDate: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    let statistics = CountryManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
       
    }


}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return statistics.countName[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        print(row)
        statistics.sendRequest(for: row)
       
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
}
extension ViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return statistics.countName.count
    }
    
    
}
