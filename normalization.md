# Normalization Process to Achieve 3NF

## Step 1: Review of Tables
- Each table was analyzed to ensure atomicity, primary keys, and valid dependencies.
- Attributes with potential redundancies or dependencies on non-primary attributes were identified.

## Step 2: Adjustments for Normalization
1. **Property Table:**
   - Ensured `host_id` references `Users` with `role='host'` only.
   - This can be enforced through a foreign key constraint or a trigger.

2. **Booking Table:**
   - Removed `total_price` as it is a derived attribute (`pricepernight * duration`).
   - Calculations can be done dynamically in queries or application logic.

## Conclusion
With these adjustments, the schema is normalized to 3NF, ensuring no data redundancy or transitive dependencies.
