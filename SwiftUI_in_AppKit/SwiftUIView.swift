//
//  SwiftUIView.swift
//  SwiftUI_in_AppKit
//
//  Created by rabbit on 2025/05/07.
//

import SwiftUI


// MARK: - SwiftUI View

struct SwiftUIView: View {

    @ObservedObject var viewModel: SwiftUIViewModel

    var body: some View {
        VStack(alignment: .center) {
            Text("SwiftUI View: \(viewModel.count)")
            Image(systemName: "swift")
                .font(.system(size: 50))
                .foregroundStyle(.red)        }
    }
}

class SwiftUIViewModel: ObservableObject {

    @Published var count: Int

    init(count: Int) {
        self.count = count
    }
}




// MARK: - Previews

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(viewModel: SwiftUIViewModel(count: 12345))
    }
}

