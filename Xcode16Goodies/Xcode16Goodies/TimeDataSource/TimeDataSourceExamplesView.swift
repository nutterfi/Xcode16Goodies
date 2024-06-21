//
//  TextCurrentDate.swift
//  Xcode16Goodies
//
//  Created by nutterfi on 6/21/24.
//

import SwiftUI

/// TimeDataSource Examples
/// TODO: .dateRange formatting

/**
 /// A time data source that produces `Date.now`.
 public static var currentDate: TimeDataSource<Date> { get }

 /// A time data source that produces the offset between `Date.now` and the given
 /// `date` as a `Duration`.
 public static func durationOffset(to date: Date) -> TimeDataSource<Duration>

 /// A time data source that produces `date..<max(date, Date.now)`.
 public static func dateRange(startingAt date: Date) -> TimeDataSource<Range<Date>>

 /// A time data source that produces `min(date, Date.now)..<date`.
 public static func dateRange(endingAt date: Date) -> TimeDataSource<Range<Date>>
 */

struct TimeDataSourceExamplesView: View {
  
  @State private var startDate = Date.now
  
  /// Shows the `TimeDataSource.currentDate` built-in property
  struct DateOffsetView: View {
    @State var startDate = Date.now
    var body: some View {
      Text(.currentDate, format: .offset(to: startDate))
    }
  }
  
  /// Shows the `SystemFormatStyle.Stopwatch` format style
  struct StopwatchView: View {
    @State var startDate = Date.now
    var body: some View {
      Text(.currentDate, format: .stopwatch(startingAt: startDate))
    }
  }
  
  struct DurationOffsetView: View {
    @State var startDate = Date.now
    var body: some View {
      Text(.durationOffset(to: startDate), format: .time(pattern: .hourMinuteSecond))
    }
  }
  
  struct DateRangeStartView: View {
    @State var startDate = Date.now.addingTimeInterval(-20000)
    @State var endDate = Date.now
    
    var dateRange: Range<Date> {
      (startDate..<endDate)
    }
    
    var body: some View {
      VStack {
        Text("TODO")
      }
//      Text(
//        .dateRange(startingAt: startDate),
//        format: .timer(countingUpIn: dateRange) // compiler complains here
//      )
    }
  }
  
  struct DateRangeEndView: View {
    @State var startDate = Date.now
    @State var endDate = Date.now.addingTimeInterval(20000)
    
    var body: some View {
      VStack {
        Text("TODO")
      }
//      Text(
//        .dateRange(endingAt: endDate),
//        format: .timer(countingUpIn: dateRange) // compiler complains here
//      )
    }
  }
  
  
  var body: some View {
    List {
      Text(.currentDate, format: .dateTime)
        .font(.title3)
      HStack {
        Text("Date Offset")
        DateOffsetView(startDate: startDate)
          .padding()
          .background(Color.yellow.gradient)
          .clipShape(.capsule)
          .monospacedDigit()
      }
      .font(.caption)
      
      HStack {
        Text("Stopwatch")
        StopwatchView(startDate: startDate)
          .padding()
          .background(Color.yellow.gradient)
          .clipShape(.capsule)
          .monospacedDigit()
      }
      .font(.caption)
      
      HStack {
        Text("Duration Offset")
        DurationOffsetView(startDate: startDate)
          .padding()
          .background(Color.yellow.gradient)
          .clipShape(.capsule)
          .monospacedDigit()
      }
      .font(.caption)
      
      HStack {
        Text("Date Range Start")
        DateRangeStartView(startDate: startDate)
          .padding()
          .background(Color.red.gradient)
          .clipShape(.capsule)
          .monospacedDigit()
      }
      .font(.caption)
      
      HStack {
        Text("Date Range End")
        DateRangeEndView(startDate: startDate)
          .padding()
          .background(Color.red.gradient)
          .clipShape(.capsule)
          .monospacedDigit()
      }
      .font(.caption)
    }
  }
}

#Preview {
    TimeDataSourceExamplesView()
}
