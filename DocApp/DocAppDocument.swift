//
//  DocAppDocument.swift
//  DocApp
//
//  Created by Johannes Brands on 23/11/2022.
//

import SwiftUI
import SceneKit
import UniformTypeIdentifiers

extension UTType {
    static var exampleText: UTType {
        UTType(importedAs: "com.example.plain-text")
    }
    static var plasmotion: UTType {
//        UTType.threeDContent
//        UTType.usd
        UTType.usdz
//        UTType(importedAs: "com.pixar.universal-scene-description-mobile")
        //.usdz conforms to UTType.threeDContent and UTType.data
    }
}

struct DocAppDocument: FileDocument {
    var text: String
    var scene: SCNScene

    init(text: String = "Hello, world!") {
        self.text = text
        self.scene = SCNScene(named: "robot.usdz")!
    }

    static var readableContentTypes: [UTType] { [.exampleText, .usdz, .obj] }

    init(configuration: ReadConfiguration) throws {
//        guard let data = configuration.file.regularFileContents,
//              let string = String(data: data, encoding: .utf8)
//        else {
//            throw CocoaError(.fileReadCorruptFile)
//        }
//        text = string
        text = "dummy"

        guard let data = configuration.file.regularFileContents,
              let source = SCNSceneSource(data: data, options: nil),
              let model = source.scene(options: nil)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        scene = model
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = text.data(using: .utf8)!
        return .init(regularFileWithContents: data)
    }
}
