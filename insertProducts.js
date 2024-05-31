const mysql = require('mysql2/promise');

// Function to validate price
function validatePrice(price) {
    const number = parseFloat(price);
    return isNaN(number) ? 'N/A' : number.toFixed(2);
}

// Manually define Aldi products
const aldiProducts = [
    { name: 'Product A', weight: '100g', price: '1.99', image_url: 'http://example.com/productA.jpg' },
    { name: 'Product B', weight: '200g', price: '2.99', image_url: 'http://example.com/productB.jpg' },
    // Add more products as needed
];

// Function to insert products into the database
async function insertProductsToDB(products, storeId) {
    const connection = await mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'shopparazzi_db'
    });

    let insertedProductPrices = 0;

    for (const product of products) {
        try {
            // Ensure all fields are defined
            const { name, weight, price, image_url } = product;
            if (!name || !weight || !price || !image_url) {
                console.error(`Skipping product due to missing data: ${JSON.stringify(product)}`);
                continue;
            }

            // Check if product already exists
            const [existingProduct] = await connection.execute(
                'SELECT id FROM products WHERE name = ? AND volume = ?',
                [name, weight]
            );

            let productId;
            if (existingProduct.length > 0) {
                // Product exists, get the productId
                productId = existingProduct[0].id;
            } else {
                // Product does not exist, insert new product
                const [rows] = await connection.execute(
                    'INSERT INTO products (name, category, volume, image_url) VALUES (?, ?, ?, ?)',
                    [name, 'Chocolate', weight, image_url]
                );
                productId = rows.insertId;
                console.log(`Inserted new product with ID ${productId}: ${name}`);
            }

            // Insert into productprices table if the price is valid
            if (price !== 'N/A') {
                const numericPrice = parseFloat(price);
                if (!isNaN(numericPrice)) {
                    await connection.execute(
                        'INSERT INTO productprices (product_id, store_id, price) VALUES (?, ?, ?)',
                        [productId, storeId, numericPrice]
                    );
                    console.log(`Inserted price for product ID ${
