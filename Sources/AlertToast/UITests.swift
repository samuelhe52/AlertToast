//
//  UITests.swift
//  AlertToast
//
//  Created by Samuel He on 2025/12/20.
//

import SwiftUI

struct TestView: View {
    let progress = 0.3
    
    var body: some View {
        VStack {
            Text("Progress: \(Int(progress * 100))%")
            ProgressView(value: progress)
                .progressViewStyle(LinearProgressViewStyle())
                .padding()
        }
        .frame(width: 200, height: 100)
    }
}


#Preview {
    TestView()
}
