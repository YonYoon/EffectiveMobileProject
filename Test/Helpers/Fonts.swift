//
//  Fonts.swift
//  Test
//
//  Created by Zhansen Zhalel on 05.06.2024.
//

import SwiftUI

struct Title1: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 22))
            .fontWeight(.semibold)
    }
}

struct Title2: View {
    private var text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(.system(size: 20))
            .fontWeight(.semibold)
    }
}

struct Title3: View {
    private var text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(.system(size: 16))
            .fontWeight(.medium)
    }
}
#Preview {
    Title3("Sample text")
}


struct Title4: View {
    private var text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(.system(size: 14))
    }
}
#Preview {
    Title4("Sample text")
}


struct Text1: View {
    private var text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(.system(size: 16))
    }
}
#Preview {
    Text1("Sample text")
}


struct Text2: View {
    private var text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(.system(size: 14))
    }
}

#Preview {
    Text2("Sample text")
}
