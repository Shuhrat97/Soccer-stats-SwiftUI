//
//  SeasonsRow.swift
//  SwiftUI_2
//
//  Created by Shuhrat Nurov on 10/08/22.
//

import SwiftUI

struct SeasonsRow: View {
    let type:SeasonType
    var body: some View {
        VStack(alignment:.leading, spacing: 20){
            Text(type.name)
                .font(.system(size: 18).bold())
            if type.name != type.abbreviation{
                Text(type.abbreviation)
            }
            Text("Start date: " + dateConverter(dateString: type.startDate))
            Text("End date: " + dateConverter(dateString: type.endDate))
        }
    }
    
    func dateConverter(dateString:String)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mmZ"
        let date = dateFormatter.date(from:dateString)!
        
        dateFormatter.dateFormat = "MMM dd, yyyy HH:mm"
        return dateFormatter.string(from:  date)
    }
}

struct SeasonsRow_Previews: PreviewProvider {
    static var previews: some View {
        SeasonsRow(type: SeasonType(id: "0", name: "English", abbreviation: "Prem", startDate: "", endDate: "", hasStandings: true))
    }
}
