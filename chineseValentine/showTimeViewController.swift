//
//  showTimeViewController.swift
//  chineseValentine
//
//  Created by 方芸萱 on 2020/8/20.
//

import UIKit

class showTimeViewController: UIViewController {
    
    var timer:Timer?

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet var timeLabel: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initDatePicker()
        getCurrentTime()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
            self.checkDatePicker()
            self.getCurrentTime()
        }
    }
    @IBAction func getDatePicker(_ sender: UIDatePicker) {
        checkDatePicker()
        getCurrentTime()
    }
    func checkDatePicker(){
        let date = datePicker.date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        timeLabel[0].text = formatter.string(from: date)
        //calculate time
        calcutateTime(time: Int(date.timeIntervalSinceNow))
    }
    func initDatePicker(){
        let dateInit = "2020/08/25 07:00"
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let datePickerInit = formatter.date(from: dateInit)!
        datePicker.setDate(datePickerInit, animated: true)
        timeLabel[0].text = dateInit
        //set minimun date to current time
        datePicker.minimumDate = Date()
        //calculate time
        calcutateTime(time: Int(datePickerInit.timeIntervalSinceNow))
     }
    func getCurrentTime(){
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let time = formatter.string(from: now)
        timeLabel[1].text = time
    }
    func calcutateTime(time:Int){
        guard time > 0 else {
            timeLabel[2].text = String("時辰到了啦！！")
            return
        }
        let sec = time % 60
        let min = time / 60 % 60
        let hour = time / 60 / 60 % 24
        let day = time / 60 / 60 / 24
        timeLabel[2].text = String("\(day)天 \(hour)時 \(min)分 \(sec)秒")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
