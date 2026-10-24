const { MongoClient } = require("mongodb");

const uri = process.env.MONGODB_URI;

async function main() {
    if (!uri) {
        throw new Error(
            "MONGODB_URI is missing. Set your MongoDB Atlas connection string first."
        );
    }

    const client = new MongoClient(uri);

    try {
        await client.connect();

        const database = client.db("expressmall_nosql");

        await database.command({ ping: 1 });

        console.log("Cloud database connection successful!");
        console.log("Database: expressmall_nosql");
        console.log("Ping successful: MongoDB Atlas is responding.");
    } catch (error) {
        console.error("Connection failed:", error.message);
        process.exitCode = 1;
    } finally {
        await client.close();
    }
}

main().catch((error) => {
    console.error(error.message);
    process.exitCode = 1;
});
