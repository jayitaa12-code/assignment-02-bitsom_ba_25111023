## ETL Decisions

### Decision 1 — Date Standardization
Problem: The dataset contained inconsistent date formats, making it difficult to perform time-based analysis.
Resolution: All dates were converted into a standard YYYY-MM-DD format to ensure consistency and accurate aggregation.

### Decision 2 — Handling Missing Values
Problem: Some records had NULL values in revenue and quantity fields, which could distort calculations.
Resolution: Missing numeric values were replaced with 0, and incomplete records were handled carefully to maintain data accuracy.

### Decision 3 — Category Normalization
Problem: Product categories had inconsistent casing (e.g., "electronics", "Electronics").
Resolution: All categories were standardized to uppercase to ensure proper grouping and reporting.