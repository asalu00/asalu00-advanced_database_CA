const dns = require("node:dns");
dns.setServers(["1.1.1.1", "8.8.8.8"]);

const { MongoClient } = require("mongodb");
const fs = require("fs");
const path = require("path");

const uri = "mongodb+srv://sam_asalu_11:Kilishiope2@cluster0.off9ixh.mongodb.net/";const client = new MongoClient(uri);
async function main() {
  try {
    await client.connect();

    const db = client.db("expressmall_nosql");
    const collection = db.collection("perfumes");

    const filePath = path.join(__dirname, "..", "models", "perfumes_data.json");
    const perfumes = JSON.parse(fs.readFileSync(filePath, "utf8"));

    const result = await collection.insertMany(perfumes);

    console.log("Perfumes inserted:", result.insertedCount);
    console.log("Collection:", collection.collectionName);
  } catch (error) {
    console.error("Import failed:", error.message);
  } finally {
    await client.close();
  }
}

main();