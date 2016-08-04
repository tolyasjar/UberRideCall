//
//  UberRideCallViewController.swift
//  UberRideCall
//
//  Created by Toleen Jaradat on 8/3/16.
//  Copyright © 2016 Toleen Jaradat. All rights reserved.
//

import UIKit

class UberRideCallViewController: UIViewController {

    @IBOutlet weak var selectedDate: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(UberRideCallViewController.showLabel), name: "yesButtonPressed", object: nil)
        
      }
    
    func showLabel() {
        self.selectedDate.hidden = false
    }
   
    
    @IBAction func datePickerAction(sender: AnyObject) {
    
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let strDate = dateFormatter.stringFromDate(datePicker.date)
        self.selectedDate.text = "You Ride has been Scheduled for: " + strDate
        //print(strDate)
        self.selectedDate.hidden = true

        
        }
        
    
    @IBAction func scheduleMyRideButtonPressed(sender: AnyObject) {
        
        AZNotification.showNotificationWithTitle(self.selectedDate.text, controller: self, notificationType: .Success, shouldShowNotificationUnderNavigationBar: true)
        
        
        let notification = UILocalNotification()
        notification.alertTitle = "Your Uber ride is here!"
        notification.alertBody = "Are you ready?"
        notification.alertAction = "Are you ready?"
        notification.category = "Are you ready?"
        notification.fireDate = self.datePicker.date
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
        }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}


