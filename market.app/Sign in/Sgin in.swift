//
//  Sgin in.swift
//  market.app
//
//  Created by abdulaziz on 12/02/2026.
//

import SwiftUI

struct Sgin_in: View {
    var body: some View {
        VStack{
            NavigationLink{
                Emil()
            }label: {
                //واجهه التعديل على الايميل 
                 Text("sign up with Email")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.6))
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle ("Sign in with Email")
        
           
        
    }
}
struct sg_in_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            Sgin_in()
        }
    }
}
