//
//  ViewController.swift
//  ProtocolOrientedExample
//
//  Created by abdullah's Ventura on 14.06.2023.
//

import UIKit

class UserViewController: UIViewController , UserVievModelOutput {
  
    
    
    private let viewModel : UserViewModel
  
    
    //create variables
    private let nameLabel : UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let userNameLabel : UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let emailLabel : UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupViews()
        viewModel.fetchUser()
    }


    private func setupViews(){
        //add view variables
        view.backgroundColor = .gray
        view.addSubview(emailLabel)
        view.addSubview(userNameLabel)
        view.addSubview(nameLabel)
     
        
        NSLayoutConstraint.activate(
        
        [
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor), //x ekseinde orta
            nameLabel.heightAnchor.constraint(equalToConstant: 60),//label yuksekligi
            nameLabel.widthAnchor.constraint(equalToConstant: 200),//label genisligi
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100), // labelin ust kismini ekranin ust kismina 100 piksel bosluk birak
            
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailLabel.heightAnchor.constraint(equalToConstant: 60),
            emailLabel.widthAnchor.constraint(equalToConstant: 200),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 50),
            
            userNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userNameLabel.heightAnchor.constraint(equalToConstant: 60),
            userNameLabel.widthAnchor.constraint(equalToConstant: 200),
            userNameLabel.topAnchor.constraint(equalTo: emailLabel.topAnchor, constant: 50)
            
        ])
        nameLabel.text = "Hello World"
        userNameLabel.text = "Hello World"
        emailLabel.text = "Hello World"
    }
    
    func UpdateView(name: String, username: String, email: String) {
        self.nameLabel.text = name
        self.emailLabel.text = email
        self.userNameLabel.text = username
    }
    
}

