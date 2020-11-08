//
//  ClockyWidget.swift
//  ClockyWidget
//
//  Created by Leisure on 08/11/2020.
//

import WidgetKit
import SwiftUI

struct ClockyEntry: TimelineEntry {
    public let date: Date
}

struct Provider: TimelineProvider {
    
    public typealias Entry = ClockyEntry
    
    func getSnapshot(in context: Context, completion: @escaping (ClockyEntry) -> Void) {
        let entry = ClockyEntry(date: Date())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<ClockyEntry>) -> Void) {
        var entries: [ClockyEntry] = []
        
        // Generate a timeline consisting of 60 entries a second apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 60 {
            let entryDate = Calendar.current.date(byAdding: .second, value: hourOffset, to: currentDate)!
            
            let entry = ClockyEntry(date: entryDate)
            
            entries.append(entry)
        }
        
        // 9
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
    
    // 10
    public func placeholder(in: Context) -> ClockyEntry {
        ClockyEntry(date: Date())
    }
}

// 11
struct ClockyWidgetEntryView : View {
    // 12
    var entry: Provider.Entry

    // 13
    @Environment(\.widgetFamily) var family: WidgetFamily
    
    // 14
    @ViewBuilder
    var body: some View {
        switch family {
        // 15
        case .systemSmall:
            ClockView(
                currentDate: entry.date
            )

        // 16
        case .systemMedium:
            HStack {
                ClockView(
                    currentDate: entry.date
                )
            }
        // 17
        case .systemLarge:
            ClockView(currentDate: entry.date)
        @unknown default:
            ClockView(currentDate: entry.date)
        }
    }
}

@main
struct ClockyWidget: Widget {
    // 1
    private let kind: String = "ClockyWidget"

    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            ClockyWidgetEntryView(entry: entry)
        }
    // 2
        .configurationDisplayName("Clocky Widget")
    // 3
        .description("Displays the current time")
    }
}


struct ClockyWidget_Previews: PreviewProvider {
    static var previews: some View {
        ClockyWidgetEntryView(entry: ClockyEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
