// lib/features/premium/presentation/screens/pricing_plans_screen.dart

import 'package:cardlink_ui_kit/core/widgets/buttons/primary_button.dart';
import 'package:cardlink_ui_kit/core/widgets/buttons/secondary_button.dart';
import 'package:cardlink_ui_kit/features/premium/data/models/pricing_plan_model.dart';
import 'package:cardlink_ui_kit/features/premium/presentation/screens/premium_benefits_screen.dart';
import 'package:cardlink_ui_kit/features/premium/presentation/screens/restore_purchases_screen.dart';
import 'package:cardlink_ui_kit/features/premium/presentation/widgets/purchase_bottom_sheet.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

enum BillingCycle { monthly, yearly }

class PricingPlansScreen extends StatefulWidget {
  const PricingPlansScreen({super.key});
  static const String routeName = '/pricing-plans';

  @override
  State<PricingPlansScreen> createState() => _PricingPlansScreenState();
}

class _PricingPlansScreenState extends State<PricingPlansScreen> {
  BillingCycle _selectedCycle = BillingCycle.yearly;

  // --- Mock Data ---
  final List<PricingPlan> _plans = [
    PricingPlan(
      name: 'Free',
      description: 'For starters',
      monthlyPrice: 0,
      yearlyPrice: 0,
      features: ['1 Digital Card', '5 Links', 'Basic Analytics'],
    ),
    PricingPlan(
      name: 'Pro',
      description: 'For professionals',
      monthlyPrice: 9.99,
      yearlyPrice: 99.99,
      features: [
        '5 Digital Cards',
        'Unlimited Links',
        'Advanced Analytics',
        'Custom Themes',
      ],
      isRecommended: true,
    ),
    PricingPlan(
      name: 'Business',
      description: 'For teams',
      monthlyPrice: 29.99,
      yearlyPrice: 299.99,
      features: [
        'Unlimited Cards',
        'Team Management',
        'Branded QR Codes',
        'Priority Support',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Go Premium')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // --- Header ---
            Text(
              'Unlock Your Full Potential',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Choose the plan that fits your needs.',
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            // --- Billing Cycle Toggle ---
            SegmentedButton<BillingCycle>(
              segments: const [
                ButtonSegment(
                  value: BillingCycle.monthly,
                  label: Text('Monthly'),
                ),
                ButtonSegment(
                  value: BillingCycle.yearly,
                  label: Text('Yearly'),
                  icon: Text('Save 15%'),
                ),
              ],
              selected: {_selectedCycle},
              onSelectionChanged: (newSelection) =>
                  setState(() => _selectedCycle = newSelection.first),
            ),
            const SizedBox(height: 32),

            // --- Pricing Cards ---
            Column(
              children: _plans
                  .map(
                    (plan) => _PricingPlanCard(
                      plan: plan,
                      selectedCycle: _selectedCycle,
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 32),

            // --- Learn More Button ---
            SecondaryButton(
              text: 'Learn more about Premium features',
              onPressed: () => context.push(PremiumBenefitsScreen.routeName),
            ),
            TextButton(
              onPressed: () => context.push(RestorePurchasesScreen.routeName),
              child: const Text('Restore Purchases'),
            ),
          ],
        ),
      ),
    );
  }
}

class _PricingPlanCard extends StatelessWidget {
  const _PricingPlanCard({required this.plan, required this.selectedCycle});
  final PricingPlan plan;
  final BillingCycle selectedCycle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final price = selectedCycle == BillingCycle.monthly
        ? plan.monthlyPrice
        : plan.yearlyPrice;
    final priceString = price == 0 ? 'Free' : '\$${price.toStringAsFixed(2)}';
    final billingPeriod = selectedCycle == BillingCycle.monthly
        ? '/month'
        : '/year';

    return Card(
      elevation: plan.isRecommended ? 4 : 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: plan.isRecommended
              ? theme.colorScheme.primary
              : theme.dividerColor,
          width: plan.isRecommended ? 2 : 1,
        ),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (plan.isRecommended)
              Text(
                'RECOMMENDED',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (plan.isRecommended) const SizedBox(height: 8),
            Text(
              plan.name,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(plan.description, style: theme.textTheme.bodyMedium),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  priceString,
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (price != 0)
                  Text(billingPeriod, style: theme.textTheme.bodyLarge),
              ],
            ),
            const SizedBox(height: 24),
            ...plan.features.map(
              (feature) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: [
                    Icon(
                      LucideIcons.circleCheck,
                      size: 18,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 12),
                    Expanded(child: Text(feature)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            plan.isRecommended
                ? PrimaryButton(
                    text: 'Choose Plan',
                    onPressed: () {
                      _showPurchaseSheet(context, plan, selectedCycle);
                    },
                  )
                : SecondaryButton(
                    text: 'Choose Plan',
                    onPressed: () {
                      _showPurchaseSheet(context, plan, selectedCycle);
                    },
                  ),
          ],
        ),
      ),
    );
  }

  ////// Show Purchase Sheet
  void _showPurchaseSheet(
    BuildContext context,
    PricingPlan plan,
    BillingCycle cycle,
  ) {
    // We don't show a purchase sheet for a free plan.
    if (plan.monthlyPrice == 0) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the sheet to be taller
      builder: (ctx) => PurchaseBottomSheet(plan: plan, cycle: cycle),
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }
}
