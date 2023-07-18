//
//  SideMenuMainVC.swift
//  SideMenu
//
//  Created by Tejesh on 29/05/23.
//

import UIKit

protocol HamburgerMenuDelegate: AnyObject {
    func didSelectMenuItem(at index: Int)
}


class SideMenuMainVC: UIViewController {
    
    var mainView = SideMenuMain()
    
    
    let menuWidth: CGFloat = 250
    var isMenuOpen = false
    let menuView = UIView()
    let colorView = UIView()
    let profileImg = UIImageView()
    
    weak var delegate: HamburgerMenuDelegate?
   
    

    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //mainView.containerView.backgroundColor = .red
        mainView.btnHamburgerMenu.addTarget(self, action: #selector(sideMenuViewOpen), for: .touchUpInside)
        mainView.btnHamburgerMenu.addTarget(self, action: #selector(sideMenuView), for: .touchUpInside)
       // sideMenuButton()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        mainView.addGestureRecognizer(tapGesture)

    }
    
    @objc func sideMenuViewOpen(){
       
        let colorWidth = mainView.frame.width * 0.75
        let colorHeight = mainView.frame.height
        colorView.frame = CGRect(x: 0, y: 0, width: colorWidth, height: colorHeight)
        colorView.backgroundColor = .systemMint //hexStringToUIColor(hex: "0052FD") // Set the desired color
        mainView.containerView.backgroundColor = .lightGray
        mainView.addSubview(colorView)
//        print(mainView.frame.height)
//        print(colorWidth)
        
        //Profile Image
        profileImg.frame = CGRect(x: mainView.frame.width * 0.05, y: mainView.frame.height * 0.10, width: 70, height: 70)
       // profileImg.backgroundColor = .blue
        //Here goes your profile image name
        profileImg.image = UIImage(named: "profile")
        profileImg.layer.cornerRadius = 35
        profileImg.clipsToBounds = true
        colorView.addSubview(profileImg)
        
        let nameEmailView = UIView()
        nameEmailView.frame = CGRect(x: profileImg.bounds.width + 20, y: mainView.frame.height * 0.10, width: colorWidth - profileImg.bounds.width - 20, height: 100)
        //nameEmailView.backgroundColor = .white
        let lblUsername = UILabel()
        lblUsername.frame = CGRect(x: profileImg.bounds.width * 0.50, y:  -5, width: colorWidth - profileImg.bounds.width - 20, height: 50)
        lblUsername.text = "Hey Username"
        //lblUsername.backgroundColor = .red
        lblUsername.textColor = .white
        nameEmailView.addSubview(lblUsername)
        
        let lblEmail = UILabel()
        lblEmail.frame = CGRect(x: profileImg.bounds.width * 0.50, y: mainView.frame.height * 0.03, width: colorWidth - profileImg.bounds.width - 20, height: 50)
        lblEmail.text = "user@email.com"
        lblEmail.textColor = .white
        nameEmailView.addSubview(lblEmail)
        
        mainView.addSubview(nameEmailView)
        
        
        
       

        
    }
    @objc func handleTap(_ gesture: UITapGestureRecognizer)  {
        
        let tapLocation = gesture.location(in: mainView.containerView)
        
        if !colorView.frame.contains(tapLocation) {
            // Tap is outside the colorView, remove the colorView from mainView
            mainView.containerView.backgroundColor = .systemBackground
            colorView.removeFromSuperview()
        }
    }
    

//    @objc func buttonAction(sender: UIButton!) {
//      print("Button tapped")
//    }
    
//   @objc func  sideMenuButton(){
//        // Add a button to toggle the menu
//        let menuButton = UIButton(type: .system)
//        menuButton.setTitle("☰", for: .normal)
//        menuButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
//        menuButton.frame = CGRect(x: 20, y: 80, width: 40, height: 40)
//        menuButton.addTarget(self, action: #selector(sideMenuView), for: .touchUpInside)
//        view.addSubview(menuButton)
//
//
//
//    }
    
//    override func viewDidAppear(_ animated: Bool) {
//           super.viewDidAppear(animated)
//           
//           // Update menu view height
//           menuView.frame.size.height = view.frame.height
//        
//        print(menuView.frame.size.height)
//       }
    
    
    
    @objc func sideMenuView() {
        print("working")
        
        // Configure menu view
        
        // Add menu items to the menu view
        let menuItemHeight: CGFloat = 50
        let menuItems = [("Home", "house.fill", "HomeViewController"),
                         ("Settings", "gearshape.fill", "SettingsViewController"),
                         ("Profile", "person.fill", "ProfileViewController"),
                         ("Logout", "lock.fill", "")]
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        
        for menuItem in menuItems {
            let title = menuItem.0
            let imageName = menuItem.1
            let vcName = menuItem.2
            
            let image = UIImage(systemName: imageName)
            
            let menuItemStackView = UIStackView()
            menuItemStackView.axis = .horizontal
            menuItemStackView.alignment = .center
            menuItemStackView.spacing = 10
            
            let iconImageView = UIImageView(image: image)
            iconImageView.tintColor = .white
            iconImageView.contentMode = .scaleAspectFit
            
            let titleLabel = UILabel()
            titleLabel.text = title
            titleLabel.textColor = .white
            
            menuItemStackView.addArrangedSubview(iconImageView)
            menuItemStackView.addArrangedSubview(titleLabel)
            
            stackView.addArrangedSubview(menuItemStackView)
            
            let menuItemButton = UIButton(type: .system)
            menuItemButton.addTarget(self, action: #selector(menuItemTapped(_:)), for: .touchUpInside)
            menuItemButton.tag = menuItems.firstIndex(where: { $0.0 == title }) ?? 0
            menuItemButton.accessibilityIdentifier = vcName
            menuItemButton.translatesAutoresizingMaskIntoConstraints = false // Disable autoresizing mask
            menuItemStackView.addSubview(menuItemButton)
            
            // Set button constraints
            NSLayoutConstraint.activate([
                menuItemButton.leadingAnchor.constraint(equalTo: menuItemStackView.leadingAnchor),
                menuItemButton.trailingAnchor.constraint(equalTo: menuItemStackView.trailingAnchor),
                menuItemButton.topAnchor.constraint(equalTo: menuItemStackView.topAnchor),
                menuItemButton.bottomAnchor.constraint(equalTo: menuItemStackView.bottomAnchor)
            ])
        }
        
        stackView.frame = CGRect(x: view.frame.width / 10, y: view.frame.height / 4, width: menuWidth, height: CGFloat(menuItems.count) * menuItemHeight)
        
        colorView.addSubview(stackView)
    }

    @objc func menuItemTapped(_ sender: UIButton) {
        guard let vcName = sender.accessibilityIdentifier else { return }
        
        switch vcName {
        case "HomeViewController":
            //Here pass your VC names
            navigateToViewController(HomeViewControllerVC())
        case "SettingsViewController":
            navigateToViewController(HomeViewControllerVC())
        case "ProfileViewController":
            navigateToViewController(HomeViewControllerVC())
        default:
            performLogout()
        }
    }

    func navigateToViewController(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }

    func performLogout() {
        // Perform logout logic here
        // For example, reset user session and navigate to login screen
    }

    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    // MARK: - Actions
        
        @objc func toggleMenu() {
            //0052FD
            isMenuOpen.toggle()
            
            let menuOffset = isMenuOpen ? 0 : -menuWidth
            
            UIView.animate(withDuration: 0.3) {
                self.menuView.frame.origin.x = menuOffset
            }
        }
        
        @objc func menuButtonTapped(_ sender: UIButton) {
            toggleMenu()
        }
        




}
