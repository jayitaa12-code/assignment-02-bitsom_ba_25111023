## Anomaly Analysis

### Insert Anomaly
In the flat file, a new product cannot be added unless it is part of an order.  
For example, if we want to add a new product like "Tablet", we must also create an OrderID because product details (product_name, category, price) are stored along with order data. This prevents independent insertion of products.

### Update Anomaly
Customer information is repeated across multiple rows.  
For example, customer "Rahul" appears in multiple rows (e.g., OrderID 101 and 104). If Rahul’s city changes from Mumbai to Pune, it must be updated in all rows. Missing one update leads to inconsistent data.

### Delete Anomaly
Deleting an order may result in loss of important information.  
For example, if OrderID 103 is the only order containing product "Milk", deleting this order will remove all information about that product from the dataset.

---

## Normalization Justification

While keeping all data in a single table may appear simpler, it introduces significant redundancy and data integrity issues. In the provided dataset, customer details such as city are repeated across multiple rows for every order they place. This leads to unnecessary duplication and increases storage usage.

More importantly, this structure introduces update anomalies. For example, if a customer relocates to a new city, every row containing that customer’s information must be updated. Missing even one row leads to inconsistent and unreliable data. Similarly, product details such as price and category are repeated for every order, increasing the risk of discrepancies if updates are not applied uniformly.

Insert anomalies also occur because new entities (like products or customers) cannot be added independently without creating an order. This limits flexibility in managing master data. Delete anomalies are equally problematic — removing an order can unintentionally delete all associated product or customer information if it exists only in that row.

By normalizing the data into separate tables (customers, products, orders, and order_items), redundancy is eliminated and each entity is stored independently. This improves data consistency, ensures referential integrity, and makes the system more scalable and maintainable. Therefore, normalization is not over-engineering but a necessary step for reliable database design.
