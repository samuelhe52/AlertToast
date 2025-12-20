//
//  UITests.swift
//  AlertToast
//
//  Created by Samuel He on 2025/12/20.
//

import SwiftUI

struct TestView: View {
    @State var progress = 0.0
    @State var displayToast = false
    
    var body: some View {
        List {
            Button("Show Progress Toast") {
                progress = 0.0
                displayToast = true
                fireTimer()
            }
        }
        .toast(
            isPresenting: $displayToast,
            alert: {
                let progressString = String(format: "%.1f", progress)
                return AlertToast(displayMode: .hud,
                           type: .progress(progress),
                           title: "\(progressString) / 1.0")
            })
    }
    
    func fireTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            let step = 0.05
            guard progress + step <= 1.0 else {
                progress = 1.0
                timer.invalidate()
                displayToast = false
                return
            }
            progress += step
        }
    }
}


#Preview {
    TestView()
}
