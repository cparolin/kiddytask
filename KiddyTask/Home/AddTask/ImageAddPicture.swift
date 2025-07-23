//
//  ImageAddPicture.swift
//  KiddyTask
//
//  Created by Camila Parolin on 23/07/25.
//

import SwiftUI
import PhotosUI

struct ImageAddPicture: View {
    
    @Binding var photoItem: PhotosPickerItem?
    
    var body: some View {
       
        
        if photoItem == nil {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundStyle(Color("PicImage"))
                    .frame(width: 250, height: 250)
                
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(Color("MemoriesPurple"))
                
            }
        }
    }
}

//#Preview {
//    ImageAddPicture()
//}
