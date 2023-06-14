//
//  UserService.swift
//  ProtocolOrientedExample
//
//  Created by abdullah's Ventura on 15.06.2023.
//

import Foundation

protocol UserService{
    func fetchUser(completion : @escaping(Result<User,Error>) -> Void)
}
