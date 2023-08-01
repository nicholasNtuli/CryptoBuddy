//
//  CryptoBuddyWidget.swift
//  CryptoBuddyWidget
//
//  Created by Sihle Ntuli on 2023/06/11.
//

import WidgetKit
import SwiftUI
import Charts

struct Provider: TimelineProvider {
    
    func placeholder(in context: Context) -> WidgetCoinModel {
        WidgetCoinModel(date: Date())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (WidgetCoinModel) -> ()) {
        let entry = WidgetCoinModel(date: Date())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<WidgetCoinModel>) -> ()) {
        /// Creating Timeline which will be update for every 15 minutes
        let currentDate = Date()
        
        Task {
            if var widgetData = try? await fetchData() {
                widgetData.date = currentDate
                let nextUpdate = Calendar.current.date(byAdding: .minute, value: 15, to: currentDate)!
                let timeLine = Timeline(entries: [widgetData], policy: .after(nextUpdate))
                completion(timeLine)
            }
        }
    }
    
    func fetchData() async throws -> WidgetCoinModel {
        let session = URLSession(configuration: .default)
        let reponse = try await session.data(from: URL(string: APIURl)!)
        let widgetData = try JSONDecoder().decode([WidgetCoinModel].self, from: reponse.0)
        
        if let data = widgetData.first {
            return data
        }
        return .init()
    }
}

struct CryptoBuddyWidgetEntryView : View {

    @Environment(\.widgetFamily) var family
    var widgetCoinModel: Provider.Entry
    
    var body: some View {
        if family == .systemMedium {
            MediumSizedWidget()
        } else {
            LockSreenWidget()
        }
    }
    
    @ViewBuilder
    func MediumSizedWidget() -> some View {
        ZStack {
            Rectangle()
                .fill(Color.theme.background)
            
            VStack {
                HStack {
                    Image("logo-transparent")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    
                    VStack(alignment: .leading) {
                        Text("Bitcoin")
                            .foregroundColor(Color.theme.accent)
                        
                        Text("BTC")
                            .font(.caption)
                            .foregroundColor(Color.theme.accent.opacity(0.5))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(widgetCoinModel.currentPrice.asCurrencyWith2Decimals())
                        .fontWeight(.semibold)
                        .foregroundColor(Color.theme.accent)
                }
                
                HStack(spacing: 15) {
                    VStack(spacing: 8) {
                        Text("This week")
                            .font(.caption)
                            .foregroundColor(Color.theme.accent.opacity(0.5))
                        
                        Text(widgetCoinModel.priceChange.asPercentString())
                            .fontWeight(.semibold)
                            .foregroundColor(widgetCoinModel.priceChange < 0 ? Color.theme.red : Color.theme.green)
                        
                    }
                    
                    Chart {
                        let graphColour = widgetCoinModel.priceChange < 0 ? Color.theme.red : Color.theme.green
                        ForEach(widgetCoinModel.sparklineIn7D.price.indices, id: \.self) {
                            index in
                            LineMark(x: .value("Hour", index), y: .value("Price", widgetCoinModel.sparklineIn7D.price[index] - min()))
                                .foregroundStyle(graphColour)
                            AreaMark(x: .value("Hour", index), y: .value("Price", widgetCoinModel.sparklineIn7D.price[index] - min()))
                                .foregroundStyle(.linearGradient(colors: [
                                    graphColour.opacity(0.2),
                                    graphColour.opacity(0.1),
                                    .clear
                                ], startPoint: .top, endPoint: .bottom))
                        }
                    }
                    .chartXAxis(.hidden)
                    .chartYAxis(.hidden)
                }
            }
            .padding(.all)
        }
    }
    
    @ViewBuilder
    func LockSreenWidget() -> some View {
        VStack(alignment:.leading) {
            HStack {
                Image("log-transparent")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .leading) {
                    Text("Bitcoin")
                        .font(.callout)
                    Text("BTC")
                        .font(.caption2)
                }
            }
            
            HStack {
                Text(widgetCoinModel.currentPrice.asCurrencyWith2Decimals())
                    .font(.callout)
                    .fontWeight(.semibold)
                    
                Text(widgetCoinModel.priceChange.asPercentString())
                    .font(.caption2)
            }
        }
    }
    
    func min() -> Double {
        if let min = widgetCoinModel.sparklineIn7D.price.min() {
            return min
        }
        return 0.0
    }
}

struct CryptoBuddyWidget: Widget {
    
    let kind: String = "CryptoBuddyWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            CryptoBuddyWidgetEntryView(widgetCoinModel: entry)
        }
        .supportedFamilies([.systemMedium, .accessoryRectangular])
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct CryptoBuddyWidget_Previews: PreviewProvider {
    static var previews: some View {
        CryptoBuddyWidgetEntryView(widgetCoinModel: WidgetCoinModel(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

fileprivate let APIURl = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
