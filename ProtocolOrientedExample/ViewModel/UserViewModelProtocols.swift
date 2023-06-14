//
//  UserViewModelProtocols.swift
//  ProtocolOrientedExample
//
//  Created by abdullah's Ventura on 15.06.2023.
//

import Foundation

protocol UserVievModelOutput: AnyObject{
    func UpdateView(name:String,username:String, email:String)
}
