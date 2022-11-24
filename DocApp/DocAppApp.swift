//
//  DocAppApp.swift
//  DocApp
//
//  Created by Johannes Brands on 23/11/2022.
//

import SwiftUI

@main
struct DocAppApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: DocAppDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
