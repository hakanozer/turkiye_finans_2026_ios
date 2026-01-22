//
//  WelcomeViewController.swift
//  turkiye_finans_2026_ios
//
//  Created by HAKAN ÖZER on 21.01.2026.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         UserDefaults.standard.removeObject(forKey: "token")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let token = UserDefaults.standard.string(forKey: "token")
        if token != nil {
            // servis kontol
            performSegue(withIdentifier: "mainTab", sender: nil)
            return
        }
        performSegue(withIdentifier: "login", sender: nil)
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
