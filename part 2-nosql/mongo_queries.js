// OP1:
db.products.insertMany([
  {
    name: "Laptop",
    category: "Electronics",
    price: 50000,
    specs: { warranty: "1 year", brand: "Dell" }
  },
  {
    name: "T-Shirt",
    category: "Clothing",
    price: 1200,
    sizes: ["S", "M", "L"],
    material: "Cotton"
  },
  {
    name: "Milk",
    category: "Groceries",
    price: 60,
    expiry_date: "2024-12-20",
    nutrition: { calories: 150 }
  }
]);

// OP2:
db.products.find({ category: "Electronics", price: { $gt: 20000 } });

// OP3:
db.products.find({ category: "Groceries", expiry_date: { $lt: "2025-01-01" } });

// OP4:
db.products.updateOne(
  { name: "Laptop" },
  { $set: { discount_percent: 10 } }
);

// OP5:
db.products.createIndex({ category: 1 });