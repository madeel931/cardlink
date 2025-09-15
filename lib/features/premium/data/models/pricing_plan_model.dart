// lib/features/premium/data/models/pricing_plan_model.dart

class PricingPlan {
  final String name;
  final String description;
  final double monthlyPrice;
  final double yearlyPrice;
  final List<String> features;
  final bool isRecommended;

  PricingPlan({
    required this.name,
    required this.description,
    required this.monthlyPrice,
    required this.yearlyPrice,
    required this.features,
    this.isRecommended = false,
  });
}
