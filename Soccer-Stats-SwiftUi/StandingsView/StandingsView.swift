//
//  StandingsView.swift
//  SwiftUI_2
//
//  Created by Shuhrat Nurov on 10/08/22.
//

import SwiftUI

struct StandingsView: View {
//    @State var seasons:DetailSeason? = nil
    @ObservedObject var viewModel:StandingsViewModel
    
    @State var tag = 0
    
    var body: some View {
            List{
                Section {
                    if let standings = viewModel.seasons?.standings {
                        ForEach(standings, id: \.id){ item in
                            StandingRow(index: standings.firstIndex{ $0.id == item.id }! + 1, standing: item)
                        }
                    }
                } header: {
                    HStack {
                        Text("Team")
                            .foregroundColor(.black)
                        Spacer()
                        HStack{
                            Text("GP")
                                .foregroundColor(.black)
                            Text("W")
                                .foregroundColor(.black)
                            Text("D")
                                .foregroundColor(.black)
                            Text("L")
                                .foregroundColor(.black)
                            Text("Pts")
                                .foregroundColor(.black)
                        }.font(.system(size: 15))
                            .frame(width: 150)
                    }
                }
                
                
            }  .onAppear(){
                viewModel.getStandings(abbr: viewModel.abbr, seasonYear: "\(viewModel.selectedYear)", completion: { item in
                    DispatchQueue.main.async {
                        self.viewModel.seasons = item
                    }
                })
            }
            .listStyle(.plain)
                .navigationTitle("Standing")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing:
                                        Picker(selection: $viewModel.selectedYear, content: {
                    ForEach(viewModel.years, id: \.self){ item in
                        Text("\(item)")
                    }
                }, label: {
                    Text(viewModel.seasonYear)
                }).onChange(of: viewModel.selectedYear) { tag in
                    self.tag = tag
                    viewModel.getStandings(abbr: viewModel.abbr, seasonYear: "\(tag)", completion: { item in
                        DispatchQueue.main.async {
                            self.viewModel.seasons = item
                        }
                    })
                }
                )
    }
}


//extension Binding {
//    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
//        return Binding(
//            get: { self.wrappedValue },
//            set: { selection in
//                self.wrappedValue = selection
//                handler(selection)
//        })
//    }
//}

struct StandingsView_Previews: PreviewProvider {
    static var previews: some View {
        StandingsView(viewModel: StandingsViewModel(abbr: "Prem", seasonYear: "2021", years: [2022, 2021, 2020, 2019]))
    }
}
