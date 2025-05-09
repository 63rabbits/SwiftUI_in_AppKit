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

    private var contentView: NSHostingView<ContentView>!
    @State private var swiftUIViewModel = ContentViewModel(count: 0)

    override func viewDidAppear() {
        self.view.window!.center()
        self.view.window?.title = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ??
            "Set TARGETS > General > Identity > Display Name"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        contentView = NSHostingView(rootView: ContentView(viewModel: swiftUIViewModel))
//        self.view.addSubview(swiftUIView)
        stackView.addView(contentView, in: .bottom)
        contentView.frame = .init(origin: .init(x: 10, y: 100), size: .init(width: 200, height: 200))
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.centerXAnchor.constraint(equalTo: contentView.superview!.centerXAnchor).isActive = true


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

