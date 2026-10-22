// ExpressMall - Portfolio 4
// NoSQL and Advanced Data Models

// 1. Select the ExpressMall database
use("expressmall_nosql");

// 2. Display all perfume documents
db.perfumes.find();

// 3. Find Amber Essence
db.perfumes.find({
  perfume_name: "Amber Essence"
});

// 4. Find perfumes with low stock
db.perfumes.find({
  stock_quantity: { $lte: 5 }
});

// 5. Count all perfume documents
db.perfumes.countDocuments();

// 6. Display perfume names and prices
db.perfumes.find(
  {},
  { _id: 0, perfume_name: 1, price: 1 }
);