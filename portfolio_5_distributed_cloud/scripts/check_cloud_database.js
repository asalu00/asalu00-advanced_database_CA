
const { MongoClient } = require("mongodb");

const uri = process.env.MONGODB_URI;

async function main() {
    if (!uri) {
        throw new Error("MONGODB_URI is missing. Set the connection string first.");
    }

    const client = new MongoClient(uri);

    try {
        await client.connect();

        const database = client.db("expressmall_nosql");
        const collections = await database.listCollections().toArray();

        console.log("Cloud database check successful!");
        console.log("Database: expressmall_nosql");
        console.log("Collections found:");

        if (collections.length === 0) {
            console.log("No collections found yet.");
        } else {
            collections.forEach((collection) => {
                console.log("- " + collection.name);
            });
        }
    } catch (error) {
        console.error("Database check failed:", error.message);
        process.exitCode = 1;
    } finally {
        await client.close();
    }
}

main().catch((error) => {
    console.error(error.message);
    process.exitCode = 1;
});
