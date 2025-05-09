//
//  ContentView.swift
//  SwiftUI_in_AppKit
//
//  Created by rabbit on 2025/05/07.
//

import SwiftUI


// MARK: - SwiftUI View

struct ContentView: View {

    @ObservedObject var viewModel: ContentViewModel

    var body: some View {
        VStack(alignment: .center) {
            Text("SwiftUI View: \(viewModel.count)")
            Image(systemName: "swift")
                .font(.system(size: 50))
                .foregroundStyle(.red)
        }
    }
}

class ContentViewModel: ObservableObject {

    @Published var count: Int

    init(count: Int) {
        self.count = count
    }
}




// MARK: - Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel(count: 12345))
    }
}

