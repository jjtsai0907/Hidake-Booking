//
//  EditAnnouncementCV.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-03-24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift


extension String {
        
    func load() -> UIImage{
            
            // try catch block
        do {
                // convert String to URL
            guard let url = URL(string: self) else{
                    // return empty image if the URL is invalid
                return UIImage()
            }
                // convert URL to data
            let data: Data = try
                Data(contentsOf: url)
                
                // create UIImage object from Data
                // and optional value if the image in URL does not exists
            return UIImage(data: data) ?? UIImage()
        } catch{
                
        }
            
            
        return UIImage()
    }
}
    


struct EditAnnouncementCV: View {
    @State var announcementValue = ""
    let db = Firestore.firestore()
    @State var showImagePicker = false
    @State var imageInBlackBox = UIImage(imageLiteralResourceName: "upload_sign")
    @State var downloadedImageURL = ""
    
    var body: some View {
        
        VStack {
            
            
            Image(uiImage: imageInBlackBox)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .onTapGesture {
                    showImagePicker.toggle()
                }.sheet(isPresented: $showImagePicker){
                    AnnouncementImageViewPicker(isPresented: self.$showImagePicker, selectedImage: self.$imageInBlackBox, downloadedImageURL: $downloadedImageURL)
                    
                }
            
            TextFieldView(placeHolder: "輸入公告內容: ", textValue: $announcementValue)
                .padding(.bottom, 20)
                
            
            
            if downloadedImageURL != "" && announcementValue != "" {
                Button(action: {
                    let announcement = Announcement()
                    
                    announcement.info = announcementValue
                    announcement.imageURL = downloadedImageURL
                    
                    
                    do {
                        try db.collection("ANNOUNCEMENTS").document(announcement.id).setData(from: announcement)
                        announcementValue = ""
                        imageInBlackBox = UIImage(imageLiteralResourceName: "upload_sign")
                        print("EditAnnouncementCV: uploaded the announcement!")
                        
                    } catch let error {
                        print("Error writing city to Firestore: \(error)")
                    }
                    
                }){
                    Text("新增公告")
                        .padding(.horizontal, 40)
                        .padding(.vertical, 8)
                        .foregroundColor(.white)
                        .font(Font.headline.weight(.bold))
                    
                }.background(Color("themeBlue"))
                .shadow(radius: 25)
                .cornerRadius(10)
                .padding(.top, 30)
            }
            
            Spacer()
            
        }
        
        
    }
}

struct EditAnnouncementCV_Previews: PreviewProvider {
    static var previews: some View {
        EditAnnouncementCV()
    }
}
