//
//  Emil.swift
//  market.app
//
//  Created by abdulaziz on 12/02/2026.
//

import SwiftUI
import Combine
@MainActor 
final class Emilview: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    
    func signin(){
        guard !email .isEmpty, !password .isEmpty else {
            print("Not faund user or password")
            return
        }
        
        Task{
            do{
                let ruturnUserData = try await Manager.shared.createUser(Emil: email, Password: password)
                print("Success")
                print(ruturnUserData)
                
            }
            catch {
                print("Error: \(error)")
            }
        }
    }
}
struct Emil: View {
    @StateObject private var viewModel = Emilview ()
    
    var body: some View {
        VStack{
            TextField("Emil...", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
             
           SecureField("Password...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            
            Button{
                viewModel.signin()
                
            }label: {
                Text("sign in")
                   .font(.headline)
                   .foregroundColor(.white)
                   .frame(height: 55)
                   .frame(maxWidth: .infinity)
                   .background(Color.blue)
                   .cornerRadius(10)
            }
            Spacer()
        }
       
            
        .padding()
        .navigationTitle ("Snin in with Emil")
        }
    }

struct EmailView: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            Emil()
        }
    }
}
