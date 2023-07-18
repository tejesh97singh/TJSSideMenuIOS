//
//  HomeViewController.swift
//  SideMenu
//
//  Created by Tejesh on 18/07/23.
//

import UIKit

class HomeViewController: UIView {
    
    @IBOutlet var containerView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
        
    }
    func initView(){
        Bundle.main.loadNibNamed("HomeViewController", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        

       
    }

}
