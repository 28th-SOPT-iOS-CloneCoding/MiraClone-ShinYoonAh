//
//  QRWidget.swift
//  QRWidget
//
//  Created by SHIN YOON AH on 2021/09/04.
//

import WidgetKit
import UIKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct QRWidgetEntryView : View {
    var entry: Provider.Entry
    private static let deeplinkURL: URL = URL(string: "widget://qrcode")!

    var body: some View {
        ZStack {
            Color.init(UIColor.init(red: 249/255, green: 224/255, blue: 7/255, alpha: 1.0))
            Image("WidgetBackground")
                .resizable()
                .frame(width: 145, height: 130, alignment: .center)
        }
        .widgetURL(QRWidgetEntryView.deeplinkURL)
    }
}

@main
struct QRWidget: Widget {
    let kind: String = "QRWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            QRWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Kakao QR Widget")
        .description("클론코딩을 통한 Kakao QR 위젯입니다.")
        .supportedFamilies([.systemSmall])
    }
}

struct QRWidget_Previews: PreviewProvider {
    static var previews: some View {
        QRWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
