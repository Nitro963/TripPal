import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/scr/shared/constants.dart';
import 'package:travel_app/scr/widgets/stars.dart';

class ReviewBarChartModel {
  final int count;
  final int rate;
  final charts.Color chartColor;

  ReviewBarChartModel(this.count, this.rate, this.chartColor);
}

/// Horizontal bar chart example
class ReviewsBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  ReviewsBarChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory ReviewsBarChart.withSampleData() {
    return new ReviewsBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    // For horizontal bar charts, set the [vertical] flag to false.
    return new charts.BarChart(seriesList,
        animate: animate,
        vertical: false,
        domainAxis: new charts.OrdinalAxisSpec(
            renderSpec: new charts.SmallTickRendererSpec(
          // Tick and Label styling here.
          labelStyle: new charts.TextStyleSpec(
              fontSize: 13, // size in Pts.
              color: charts.ColorUtil.fromDartColor(const Color(0xff8c8c98))),
        )),

        /// Assign a custom style for the measure axis.
        primaryMeasureAxis: new charts.NumericAxisSpec(
            renderSpec: new charts.GridlineRendererSpec(

                // Tick and Label styling here.
                labelStyle: new charts.TextStyleSpec(
                    fontSize: 13, // size in Pts.
                    color: charts.ColorUtil.fromDartColor(
                        const Color(0xff8c8c98))),

                // Change the line colors to match text color.
                lineStyle: new charts.LineStyleSpec(
                    dashPattern: [4],
                    color: charts.ColorUtil.fromDartColor(
                        const Color(0xff8c8c98))))));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<ReviewBarChartModel, String>> _createSampleData() {
    final data = [
      ReviewBarChartModel(
          10, 5, charts.ColorUtil.fromDartColor(starsActivationColor)),
      ReviewBarChartModel(
          7, 4, charts.ColorUtil.fromDartColor(starsActivationColor)),
      ReviewBarChartModel(
          8, 3, charts.ColorUtil.fromDartColor(starsActivationColor)),
      ReviewBarChartModel(
          3, 2, charts.ColorUtil.fromDartColor(starsActivationColor)),
      ReviewBarChartModel(
          0, 1, charts.ColorUtil.fromDartColor(starsActivationColor)),
    ];

    return [
      new charts.Series<ReviewBarChartModel, String>(
        id: 'Reviews',
        domainFn: (ReviewBarChartModel reviews, _) => reviews.rate.toString(),
        measureFn: (ReviewBarChartModel reviews, _) => reviews.count,
        colorFn: (ReviewBarChartModel reviews, _) => reviews.chartColor,
        data: data,
      )
    ];
  }
}
