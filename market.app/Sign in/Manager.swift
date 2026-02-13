//
//  Manager.swift
//  market.app
//
//  Created by abdulaziz on 12/02/2026.
//

import Foundation
import FirebaseAuth
struct AuthDataResultModel{
    let uid:String
   let email:String?
    let potourl:String?
    init(user:User) {
        self.uid = user.uid
        self.email = user.email
        self.potourl = user.photoURL?.absoluteString
    }
    
}



 final class Manager {
    static  let shared = Manager()
     private init(){}
     
     
         func createUser(Emil:String,Password:String)async throws ->AuthDataResultModel{
let authDataResult = try await Auth.auth().createUser(withEmail: Emil, password:Password)
             return AuthDataResultModel (user:authDataResult.user)
             
         }
     }

