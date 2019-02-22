//
//  ViewController.swift
//  TEST
//
//  Created by Егоров Андрей on 16.02.2019.
//  Copyright © 2019 Andrey Egorov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    
    @IBOutlet weak var myTableView: UITableView!
    
    var myDate = Date()
    var dayWeekArray = [Int]()
    var nightWeekArray = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        for i in stride(from: 3, to: 53, by: 4) {
            dayWeekArray.append(i)
        }
        
        for i in stride(from: 1, to: 53, by: 4) {
            nightWeekArray.append(i)
        }
//        print(dayWeekArray)
//        print(nightWeekArray)
        
        
        

        let calendar = Calendar.current
        let myCalendarComponents = Calendar.current.dateComponents([ .month, .day, .weekday, .hour ], from: myDate)
        
        // неделя в секундах
        var weekInSecond = TimeInterval()
        weekInSecond = 7 * 24 * 60 * 60
        //сутки
        var dayInSecond = TimeInterval()
        dayInSecond = 24 * 60 * 60
        
        //сегодняшний день и месяц
        let dayToday = myCalendarComponents.day!
        let monthToday = myCalendarComponents.month
        
        //последний день месяца
        var lastDayOfMonth = calendar.date(byAdding: .month, value: 1, to: myDate)
        lastDayOfMonth = calendar.date(byAdding: .day, value: -dayToday, to: lastDayOfMonth!)
        
        //первый месяц в году и первый рабочий день
        let firstMonth = calendar.date(byAdding: .month, value: (-monthToday!)+1, to: myDate)
        let firstJobDay = calendar.date(byAdding: .day, value: -dayToday, to: firstMonth!)
        
        let numberJobWeek = 3
        
        //первый и последний день рабочей недели
        let startDayJobWeek = firstJobDay?.addingTimeInterval((weekInSecond*2) * Double(numberJobWeek))
        let lastDayJobWeek = startDayJobWeek?.addingTimeInterval(weekInSecond - dayInSecond)
        
        //последний день выбранного месяца
        let jobWeekComponents = Calendar.current.dateComponents([ .month, .day, .weekday, .hour ], from: startDayJobWeek!)
        let dayOnly = jobWeekComponents.day
        
        var lastDayOfSelectMonth = calendar.date(byAdding: .month, value: 1, to: startDayJobWeek!)
        lastDayOfSelectMonth = calendar.date(byAdding: .day, value: -dayOnly!, to: lastDayOfSelectMonth!)

        let startSelectDayJobWeek = calendar.component(.month, from: startDayJobWeek!)
        let lastSelectDayJobWeek = calendar.component(.month, from: lastDayJobWeek!)
        
        if lastSelectDayJobWeek > startSelectDayJobWeek {
            print("Start = \(startDayJobWeek!) End1 = \(lastDayOfSelectMonth!)")
        }else{
            print("Start = \(startDayJobWeek!) End = \(lastDayJobWeek!)")
        }
        
        
    }
    
    
//    @IBAction func button1(_ sender: Any) {
//        let myAllertController = UIAlertController(title: "AHTUNG!", message: "Если ты красавчик нажми ОК", preferredStyle: .actionSheet)
//        let alertAction = UIAlertAction(title: "OK", style: .default) { (action) in
//
//        }
//        myAllertController.addAction(alertAction)
//        self.present(myAllertController, animated: true, completion: nil)
//
//    }
    
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return 1
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = "b"
            return cell
        }
    
    
}

