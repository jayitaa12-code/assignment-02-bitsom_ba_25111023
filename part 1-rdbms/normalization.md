## Anomaly Analysis

### Insert Anomaly
A new product cannot be added unless an order exists.
Example: Product column depends on OrderID → cannot insert independently.

### Update Anomaly
If a customer's city changes, it must be updated in multiple rows.
Example: Customer "Rahul" appears in multiple rows → risk of inconsistency.

### Delete Anomaly
Deleting an order removes customer/product info permanently.
Example: Deleting last order of a product removes product record.

## Normalization Justification

Keeping everything in one table introduces redundancy and inconsistency...
(Write ~220 words — argue normalization reduces duplication, improves integrity, avoids anomalies)