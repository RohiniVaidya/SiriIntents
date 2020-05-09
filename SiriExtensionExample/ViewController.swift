//
//  ViewController.swift
//  SiriExtensionExample
//
//  Created by Admin on 5/8/20.
//  Copyright © 2020 Rohini. All rights reserved.
//

import UIKit
import Intents
import CoreSpotlight
import MobileCoreServices
import IntentsUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func exercise(_ sender: Any) {
        print("call exercise")
        let activity = configureActivity()
        sayHi()
        
    }
    
    func configureActivity() -> NSUserActivity{
        let activity = NSUserActivity(activityType: "com.rohini.SiriExtensionExample.exercise")
        
        let attributes = CSSearchableItemAttributeSet(itemContentType: kUTTypeItem as String)

        
        activity.title = "Start today's music exercise"
        activity.isEligibleForSearch = true
        activity.isEligibleForPrediction = true
        activity.persistentIdentifier = NSUserActivityPersistentIdentifier("com.rohini.SiriExtensionExample.exercise") // 6
        activity.suggestedInvocationPhrase = "start practicing music!"
        activity.contentAttributeSet = attributes
        self.userActivity = activity
        self.userActivity?.becomeCurrent()
        return self.userActivity!
    }
    
    public func sayHi() {
           let alert = UIAlertController(title: "Hi There!", message: "Hey there! Glad to see you got this working!", preferredStyle: UIAlertController.Style.alert)
           alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
           self.present(alert, animated: true, completion: nil)
       }
    
    @IBAction func addSiriShortcut(_ sender: Any) {
        let shortcut = INShortcut(userActivity: configureActivity())
        let vc = INUIAddVoiceShortcutViewController(shortcut: shortcut)
        vc.delegate = self

        present(vc, animated: true, completion: nil)
    }
}


extension ViewController: INUIAddVoiceShortcutViewControllerDelegate{
    func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
        dismiss(animated: true, completion: nil)

    }
    
    func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
        dismiss(animated: true, completion: nil)

    }

}
