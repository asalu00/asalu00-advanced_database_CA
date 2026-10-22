const dns = require("node:dns");
dns.setServers(["1.1.1.1", "8.8.8.8"]);

const { MongoClient } = require("mongodb");

const uri = "mongodb+srv://sam_asalu_11:Kilishiope2@cluster0.off9ixh.mongodb.net/";const client = new MongoClient(uri);

async function main() {
  try {
    await client.connect();
    console.log("Connected successfully to MongoDB Atlas!");

    const db = client.db("expressmall_nosql");
    console.log("Database selected:", db.databaseName);
  } catch (error) {
    console.error("Connection failed:", error.message);
  } finally {
    await client.close();
  }
}

main();
