//
//  MainView.swift
//  SwiftUI_2
//
//  Created by Shuhrat Nurov on 10/08/22.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.arr, id: \.id){ item in
                    Section{
                        NavigationLink {
                            SeasonsView(viewModel: SeasonsViewModel(league: item))
                        } label: {
                            MainViewRow(url: URL(string: item.logos.light)!, name: item.name, abbr: item.abbr)
                        }
                    }
                }
            }
            
            .navigationTitle("Leagues")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}




struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

// A View wrapper to make the modifier easier to use
extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}
