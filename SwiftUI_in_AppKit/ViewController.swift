//
//  ViewController.swift
//  SwiftUI_in_AppKit
//
//  Created by rabbit on 2025/05/07.
//

import Cocoa
import SwiftUI

class ViewController: NSViewController {

    @IBOutlet weak var stackView: NSStackView!
    @IBOutlet weak var countLabel: NSTextField!

    private var swiftUIView: NSHostingView<SwiftUIView>!
    @State private var swiftUIViewModel = SwiftUIViewModel(count: 0)

    override func viewDidAppear() {
        self.view.window!.center()
        self.view.window?.title = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? "Set TARGETS > General > Identity > Display Name"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        swiftUIView = NSHostingView(rootView: SwiftUIView(viewModel: swiftUIViewModel))
//        self.view.addSubview(swiftUIView)
        stackView.addView(swiftUIView, in: .bottom)
        swiftUIView.frame = .init(origin: .init(x: 10, y: 100), size: .init(width: 200, height: 200))
        swiftUIView.translatesAutoresizingMaskIntoConstraints = false
        swiftUIView.centerXAnchor.constraint(equalTo: swiftUIView.superview!.centerXAnchor).isActive = true


        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.swiftUIViewModel.count += 1
            self.countLabel.stringValue = "AppKit View: \(self.swiftUIViewModel.count)"
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}

