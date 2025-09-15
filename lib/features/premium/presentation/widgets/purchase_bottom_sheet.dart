// lib/features/premium/presentation/widgets/purchase_bottom_sheet.dart

import 'package:cardlink_ui_kit/core/widgets/buttons/primary_button.dart';
import 'package:cardlink_ui_kit/features/premium/data/models/pricing_plan_model.dart';
import 'package:cardlink_ui_kit/features/premium/presentation/screens/confirmation_screen.dart';
import 'package:cardlink_ui_kit/features/premium/presentation/screens/pricing_plans_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class PurchaseBottomSheet extends StatelessWidget {
  const PurchaseBottomSheet({
    super.key,
    required this.plan,
    required this.cycle,
  });

  final PricingPlan plan;
  final BillingCycle cycle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final price = cycle == BillingCycle.monthly
        ? plan.monthlyPrice
        : plan.yearlyPrice;
    final priceString = '\$${price.toStringAsFixed(2)}';
    final billingPeriod = cycle == BillingCycle.monthly
        ? 'Billed Monthly'
        : 'Billed Annually';

    return Padding(
      padding: const EdgeInsets.all(24.0).copyWith(bottom: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Confirm Your Purchase',
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 24),

          // --- Order Summary ---
          _buildSummaryCard(
            context,
            children: [
              Text('PLAN', style: theme.textTheme.labelSmall),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    plan.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    priceString,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(billingPeriod, style: theme.textTheme.bodySmall),
            ],
          ),
          const SizedBox(height: 16),

          // --- Payment Method ---
          _buildSummaryCard(
            context,
            children: [
              Text('PAY WITH', style: theme.textTheme.labelSmall),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(LucideIcons.creditCard, size: 20), // Placeholder
                  const SizedBox(width: 12),
                  const Text('Visa ending in 1234'), // Mock payment method
                  const Spacer(),
                  TextButton(onPressed: () {}, child: const Text('Change')),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),

          // --- Price Breakdown ---
          _buildPriceRow('Subtotal', priceString),
          _buildPriceRow('Taxes & Fees', '\$0.00'), // Mock tax
          const Divider(height: 24),
          _buildPriceRow('Total Due Today', priceString, isTotal: true),
          const SizedBox(height: 24),

          // --- Confirm Button ---
          PrimaryButton(
            text: 'Confirm & Pay $priceString',
            icon: const Icon(LucideIcons.lock, size: 18),
            onPressed: () {
              context.go(ConfirmationScreen.routeName);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(
    BuildContext context, {
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
