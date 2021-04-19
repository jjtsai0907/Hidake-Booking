//
//  AnnouncementImageViewPicker.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-04-18.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import UIKit


struct AnnouncementImageViewPicker: UIViewControllerRepresentable {
    
    @Binding var isPresented: Bool
    
    @Binding var selectedImage: UIImage
    
    @Binding var downloadedImageURL: String
    
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<AnnouncementImageViewPicker>) -> UIViewController {
        let controller = UIImagePickerController()
        controller.delegate = context.coordinator
        return controller
    }
    
    func makeCoordinator() -> AnnouncementImageViewPicker.Coordinator {
        return Coordinator(parent: self)
    }
    
    
    
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
        
        let parent: AnnouncementImageViewPicker
        init(parent: AnnouncementImageViewPicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImageFromPicker = info[.originalImage] as? UIImage {
                print(selectedImageFromPicker)
                self.parent.selectedImage = selectedImageFromPicker
                
                let uuid = UUID().uuidString
               
                let storage = Storage.storage()
                let imageRef = storage.reference().child(uuid)

                if let imageData = selectedImageFromPicker.pngData(){
                    imageRef.putData(imageData, metadata: nil) { (data, error) in
                        if let err = error {
                            print(" upload iamge error \(err)")
                        }else{
                            print("uploaded image")
                            
                            imageRef.downloadURL { (url, error) in
                                if let err = error {
                                    print("error for getting URL: \(err)")
                                }else{
                                    print("Got image URL")
                                    print(url!.absoluteString)
                                    
                                    self.parent.downloadedImageURL = url!.absoluteString
                               
                                }
                            }
                            
                        }
                    }
                    
                }else{
                    print("cannot unwrap image to data")
                }
                
                
            }
            self.parent.isPresented = false
        }
    }
    
   
    
    func updateUIViewController(_ uiViewController: AnnouncementImageViewPicker.UIViewControllerType, context: UIViewControllerRepresentableContext<AnnouncementImageViewPicker>) {
        
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global(qos: .background).async {
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
    
}


/*
struct AnnouncementImageViewPicker_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementImageViewPicker()
    }
}
*/
