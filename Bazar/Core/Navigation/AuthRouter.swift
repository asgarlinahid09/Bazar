//
//  AuthRouter.swift
//  Bazar
//
//  Created by Nahid Askerli on 23.10.26.
//

import SwiftUI

enum AuthRoute: Hashable {
    case signUp
    case forgotPassword
}

@Observable
final class AuthRouter {
    var path = NavigationPath()
    
    func navigate(to destination: AuthRoute){
        path.append(destination)
    }
    
    func navigateBack(){
        guard !path.isEmpty else {return}
        path.removeLast()
    }
    
    func navigateToRoot(){
        path = NavigationPath()
    }
}
