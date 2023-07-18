//
//  SideMenuMain.swift
//  SideMenu
//
//  Created by Tejesh on 29/05/23.
//

import UIKit

class SideMenuMain: UIView{
   
    

    @IBOutlet weak var btnHamburgerMenu: UIButton!
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
        Bundle.main.loadNibNamed("SideMenuMain", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
      
    }
    
    
    @IBAction func onClickHamburgerMenu(_ sender: UIButton) {
        print("Working")
      
        
    }
    
}
