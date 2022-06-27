//
//  CertificateView.swift
//  CombineAndData (iOS)
//
//  Created by Борис Ларионов on 28.01.2022.
//

import SwiftUI

struct CertificateView: View {
    @StateObject var certificateVM = CertificateViewModel()
    @StateObject var networkReachability = NetworkReachability()
    @State private var selection: Int = 0
    
    
    var body: some View {
        VStack {
            if networkReachability.reachable {
                if !certificateVM.certificates.isEmpty {
                    TabView (selection: $selection) {
                        ForEach(certificateVM.certificates.indices, id: \.self) { index in
                            CertificateCard(selection: $selection)
                                .padding(.horizontal, 8)
                                .environmentObject(certificateVM)
                        }
                    }
                    
                .tabViewStyle(.page(indexDisplayMode: certificateVM.certificates.isEmpty ? .never : .always))
                } else {
                    ProgressView()
                }
                
            } else {
                Text("Please connect to the Internet to see your certificates")
                    .multilineTextAlignment(.center)
            }
            
        }
        .background(AccountBackground())
    }
}

struct CertificateView_Previews: PreviewProvider {
    static var previews: some View {
        CertificateView()
    }
}
