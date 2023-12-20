//
//  PickerViewController.swift
//  UIComponents
//
//  Created by Aniket Kadia on 24/05/23.
//

import UIKit

class PickerViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak private var textFieldTask: UITextField!
    @IBOutlet weak private var textFieldTaskDate: UITextField!
    @IBOutlet weak private var textFieldTaskFinishTime: UITextField!
    
    //MARK: - Variables
    let pickerViewForTask = UIPickerView()
    let dateView = UIDatePicker()
    let timeView = UIDatePicker()
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Setup View
extension PickerViewController {
    func setupView() {
        textFieldTask.inputView = pickerViewForTask
        pickerViewForTask.resignFirstResponder()
        pickerViewForTask.delegate = self
        pickerViewForTask.dataSource = self
        textFieldTaskDate.inputView = dateView
        dateView.preferredDatePickerStyle = .inline
        dateView.datePickerMode = .date
        dateView.addTarget(self, action: #selector(tapOnDate), for: .valueChanged)
        textFieldTaskFinishTime.inputView = timeView
        timeView.preferredDatePickerStyle = .wheels
        timeView.datePickerMode = .time
        timeView.addTarget(self, action: #selector(tapOnTime), for: .valueChanged)
    }
}

//MARK: - @objc Methods
extension PickerViewController {
    @objc func tapOnDate() {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        textFieldTaskDate.text = formatter.string(from: dateView.date)
        textFieldTaskDate.endEditing(true)
    }
    
    @objc func tapOnTime() {
        let formatter = DateFormatter()
        formatter.timeStyle = .long
        textFieldTaskFinishTime.text = formatter.string(from: timeView.date)
        textFieldTaskFinishTime.resignFirstResponder()
    }
}

//MARK: - UIPickerViewDataSource
extension PickerViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        AppConstants.taskPickerViewNumberOfComponents
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == AppConstants.zeroIndexComponents {
            return Organization.getTaskDetails().count
        } else {
            return Organization.getTaskDetails()[pickerViewForTask.selectedRow(inComponent: AppConstants.zeroIndexComponents)].taskName.count
        }
    }
}

//MARK: - UIPickerViewDelegate
extension PickerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == AppConstants.zeroIndexComponents {
            return Organization.getTaskDetails()[row].category
        } else {
            return Organization.getTaskDetails()[pickerViewForTask.selectedRow(inComponent: AppConstants.zeroIndexComponents)].taskName[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerViewForTask.reloadComponent(AppConstants.firstIndexComponents)
        textFieldTask.text = Organization.getTaskDetails()[pickerViewForTask.selectedRow(inComponent: AppConstants.zeroIndexComponents)].taskName[pickerViewForTask.selectedRow(inComponent: AppConstants.firstIndexComponents)]
    }
}
