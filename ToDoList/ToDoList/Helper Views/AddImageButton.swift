//
//  AddImageButton.swift
//  ToDoList
//
//  Created by Timur Dolotkazin on 30.05.2022.
//

import SwiftUI

struct AddImageButton: View {

    @Binding var showImagePicker: Bool

    var body: some View {
        Button {
            showImagePicker = true
        } label: {
            Text("Add photo")
                .foregroundColor(.black)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.black, lineWidth: 2)
                )
        }
    }
}

struct AddImageButton_Previews: PreviewProvider {
    static var previews: some View {
        AddImageButton(showImagePicker: .constant(false))
    }
}
