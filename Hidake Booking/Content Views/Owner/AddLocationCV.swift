//
//  AddLocationCV.swift
//  Hidake Booking
//
//  Created by Jia-Jiuan Tsai on 2021-09-19.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct AddLocationCV: View {
    
    @State var selectedCategory = "..."
    let categories = ["新手登山", "初階百岳", "中階百岳", "高階百岳", "露營之旅", "野溪溫泉"]
    @State var showingCategory = false
    @State var newLocation = "..."
    let db = Firestore.firestore()
    
    var body: some View {
        
        
        VStack{
            
            Text("在 \(selectedCategory) 新增 \(newLocation)")
                .font(.title)
                .padding(30)
            
            
            DisclosureGroup("Selected:    \(selectedCategory)", isExpanded: $showingCategory){
                ScrollView{
                    VStack{
                        
                        ForEach(categories, id: \.self){ type in
                            Text(type)
                                .bold()
                                .frame(maxWidth: .infinity)
                                .padding(5)
                                .onTapGesture {
                                    self.selectedCategory = "\(type)"
                                    print("selectedCategory: \(self.selectedCategory)")
                                }
                        }
                    }
                }.frame(height: 200)
            }
            
            
            TextFieldView(placeHolder: "新地點...", textValue:  $newLocation)
            
            Button {
                
            
                addLocation(newLocation: newLocation)
                
                print("addLocation: Added New Location")
            } label: {
                Text("新增地點")
                    .bold()
                    .padding(.horizontal, 40)
                    .padding(.vertical, 8)
                    .foregroundColor(.white)
            }.background(Color("themeBlue"))
            .shadow(radius: 25)
            .cornerRadius(10)
            .padding()

        }
        
        
    }
    
   
    
    func addLocation(newLocation: String){
        

            do {
                try
                    
                    db.collection("種類").document(selectedCategory).updateData([
                        selectedCategory: FieldValue.arrayUnion([newLocation])
                    ])
                
                print("AddLocation: add new location \(newLocation)")

            } catch let error {
                print("AddLocation: add new location Error writing to Firestore: \(error)")
            }

        
    }
}

struct AddLocationCV_Previews: PreviewProvider {
    static var previews: some View {
        AddLocationCV()
    }
}
