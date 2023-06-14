//
//  POViewModel.swift
//  ProtocolOrientedExample
//
//  Created by abdullah's Ventura on 15.06.2023.
//

import Foundation


class UserViewModel{
    
    private var userService : UserService
    weak var output : UserVievModelOutput?
    init(userService : UserService){
        self.userService = userService
    }
    
    func fetchUser(){
        userService.fetchUser { [weak self] result in
            switch result{
            case .success(let user):
                self?.output?.UpdateView(name: user.name, username: user.username, email: user.email)
            case.failure(_):
                self?.output?.UpdateView(name: "No User", username: "", email: "")
            }
        }
        
    }
}
