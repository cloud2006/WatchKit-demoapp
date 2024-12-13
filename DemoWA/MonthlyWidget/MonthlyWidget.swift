//
//  MonthlyWidget.swift
//  MonthlyWidget
//
//  Created by Pavlo Antoniuk on 10.12.2024.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), emoji: "+", text: "DemoApp1")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emoji: "😀", text: "App2")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: "🔄", text: "App3")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }

//    func relevances() async -> WidgetRelevances<Void> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let emoji: String
    let text: String
}

struct MonthlyWidgetEntryView : View {
    var entry: Provider.Entry
    
    @Environment(\.widgetFamily) var family

    var body: some View {
        switch family {
        case .accessoryCorner:
            Text(entry.text.prefix(2)) // Show short text
                .font(.caption)
        case .accessoryCircular:
            ZStack {
                Circle().stroke(lineWidth: 3)
                    .background(Color.green)
                Text(entry.text.prefix(1)) // Show a single character
            }
        case .accessoryRectangular:
            ZStack {
                Rectangle().stroke(lineWidth: 1)
                    .background(Color.orange)
                VStack {
                    Text("here is my Complication")
                    Text(entry.text).font(.headline)
                }
            }
        default:
            Text(entry.text) // Fallback
        }
    }

//    var body: some View {
//        VStack {
//            HStack {
//                Text("Time:")
//                Text(entry.date, style: .time)
//            }
//
//            Text("Emoji:")
//            Text(entry.emoji)
//        }
//    }
}

@main
struct MonthlyWidget: Widget {
    let kind: String = "MonthlyWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(watchOS 10.0, *) {
                MonthlyWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                MonthlyWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .accessoryRectangular) {
    MonthlyWidget()
} timeline: {
    SimpleEntry(date: .now, emoji: "😀", text: "DemoApp")
    SimpleEntry(date: .now, emoji: "🤩", text: "DemoApp")
}
