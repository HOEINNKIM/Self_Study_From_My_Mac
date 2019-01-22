//
//  ViewController.swift
//  DatePicker
//
//  Created by 김회인 on 21/01/2019.
//  Copyright © 2019 HOEINN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    var alarmTime = ""
    var isAlarmOn = false
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @objc func updateTime(){
        //lblCurrentTime.text = String(count)
        //count = count + 1
        
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm aaa"
        lblCurrentTime.text = "현재시간 : " + formatter.string(from: date as Date)
        let currentTime = formatter.string(from: date as Date)
        if(alarmTime == currentTime){
            view.backgroundColor = UIColor.red
            
            if(!isAlarmOn){
                let alert = UIAlertController(title: "알람", message: "일어나세욧!!", preferredStyle: UIAlertController.Style.alert)
                let alertAction = UIAlertAction(title: "하이, 와카리마시타", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(alertAction)
                present(alert, animated: true, completion: nil)
                isAlarmOn = true
            } else {
                isAlarmOn = false;
            }
        } else {
            view.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm aaa"
        
        lblPickerTime.text = "선택시간 : " + formatter.string(from: datePickerView.date)
        alarmTime = formatter.string(from: datePickerView.date)
        
    }
    
    
}
