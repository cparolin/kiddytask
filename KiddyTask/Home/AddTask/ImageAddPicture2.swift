//
//  ImageAddPicture2.swift
//  KiddyTask
//
//  Created by Camila Parolin on 06/08/25.
//

import SwiftUI
import PhotosUI

struct ImageAddPicture2: View {
    
    @Binding var photoItem2: PhotosPickerItem?
    
    var body: some View {
       
        
        if photoItem2 == nil {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundStyle(Color("PicImage2"))
                    .frame(width: 150, height: 150)
                
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 45, height: 30)
                    .foregroundStyle(Color("PicImage"))
                
            }
        }
    }
}
