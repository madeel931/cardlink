// lib/features/link_builder/presentation/screens/link_analytics_screen.dart

import 'dart:math';
import 'package:cardlink_ui_kit/core/widgets/custom_card.dart';
import 'package:cardlink_ui_kit/features/card_builder/data/models/populated_card_model.dart';
import 'package:cardlink_ui_kit/features/card_builder/presentation/widgets/link_button.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

enum DateRange { sevenDays, thirtyDays, allTime }

class LinkAnalyticsScreen extends StatefulWidget {
  const LinkAnalyticsScreen({super.key, required this.link});
  static const String routeName = '/link-analytics';
  final UserLink link;

  @override
  State<LinkAnalyticsScreen> createState() => _LinkAnalyticsScreenState();
}

class _LinkAnalyticsScreenState extends State<LinkAnalyticsScreen> {
  DateRange _selectedRange = DateRange.thirtyDays;

  // Mock data generation
  List<FlSpot> _generateChartData() {
    final random = Random();
    List<FlSpot> spots = [];
    int days = 30;
    if (_selectedRange == DateRange.sevenDays) days = 7;
    if (_selectedRange == DateRange.allTime) days = 90;

    for (int i = 0; i < days; i++) {
      spots.add(
        FlSpot(i.toDouble(), 10 + random.nextDouble() * 40 + (i * 0.5)),
      );
    }
    return spots;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final chartData = _generateChartData();

    return Scaffold(
      appBar: AppBar(title: Text('Analytics for ${widget.link.title}')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinkButton(icon: widget.link.icon, title: widget.link.title),
            const SizedBox(height: 24),

            // --- Date Range Selector ---
            SegmentedButton<DateRange>(
              segments: const [
                ButtonSegment(value: DateRange.sevenDays, label: Text('7D')),
                ButtonSegment(value: DateRange.thirtyDays, label: Text('30D')),
                ButtonSegment(value: DateRange.allTime, label: Text('All')),
              ],
              selected: {_selectedRange},
              onSelectionChanged: (newSelection) {
                setState(() => _selectedRange = newSelection.first);
              },
            ),
            const SizedBox(height: 24),

            // --- Chart ---
            CustomCard(
              padding: const EdgeInsets.all(20).copyWith(right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Clicks', style: theme.textTheme.titleMedium),
                  Text(
                    chartData.length.toString(),
                    style: theme.textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 150,
                    child: LineChart(
                      LineChartData(
                        gridData: const FlGridData(show: false),
                        titlesData: const FlTitlesData(show: false),
                        borderData: FlBorderData(show: false),
                        lineBarsData: [
                          LineChartBarData(
                            spots: chartData,
                            isCurved: true,
                            color: theme.colorScheme.primary,
                            barWidth: 4,
                            isStrokeCapRound: true,
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(
                              show: true,
                              gradient: LinearGradient(
                                colors: [
                                  theme.colorScheme.primary.withOpacity(0.3),
                                  theme.colorScheme.primary.withOpacity(0.0),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // --- Breakdown Stats ---
            _buildStatTile(
              context,
              icon: LucideIcons.mousePointerClick,
              title: 'Click-Through Rate',
              value: '4.8%',
            ),
            const SizedBox(height: 16),
            _buildStatTile(
              context,
              icon: LucideIcons.mapPin,
              title: 'Top Location',
              value: 'Pakistan',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
  }) {
    final theme = Theme.of(context);
    return CustomCard(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon, color: theme.colorScheme.onSurfaceVariant),
        title: Text(title, style: theme.textTheme.bodyLarge),
        trailing: Text(
          value,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
