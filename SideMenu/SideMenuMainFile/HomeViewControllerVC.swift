//
//  HomeViewControllerVC.swift
//  SideMenu
//
//  Created by Tejesh on 18/07/23.
//

import UIKit

class HomeViewControllerVC: UIViewController {
    
    var mainView = HomeViewController()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
