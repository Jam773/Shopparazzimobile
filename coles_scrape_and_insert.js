const puppeteer = require('puppeteer');
const mysql = require('mysql2/promise');

async function scrapeColesData() {
  try {
    const browser = await puppeteer.launch({ headless: false });
    const page = await browser.newPage();
    await page.goto('https://www.coles.com.au/browse/pantry/confectionery/chocolate-blocks');

    await page.waitForSelector('.LinesEllipsis.product__title');
    await page.waitForSelector('.price__value');

    const products = await page.evaluate(() => {
      const productsData = [];
      const nameElements = document.querySelectorAll('.LinesEllipsis.product__title');
      const priceElements = document.querySelectorAll('.price__value');
      const imageElements = document.querySelectorAll('img[data-testid="product-image"]');

      nameElements.forEach((nameElement, index) => {
        const name = nameElement.textContent.trim();
        const price = priceElements[index].textContent.trim().replace('$', '');
        const imageSrc = imageElements[index].getAttribute('src');
        const weightMatch = name.match(/\|\s*(\d+(\.\d+)?)\s*(g|kg|ml|L)/i);
        let weight = 'Unknown';
        if (weightMatch) {
          weight = weightMatch[1] + weightMatch[3].toLowerCase();
        }
        const productName = name.replace(/\|\s*\d+(\.\d+)?\s*(g|kg|ml|L)/i, '').trim();
        productsData.push({ name: productName, weight, price, imageUrl: imageSrc });
      });

      return productsData;
    });

    await browser.close();
    return products;
  } catch (error) {
    console.error('Error scraping Coles data:', error);
    throw error;
  }
}

(async () => {
  const products = await scrapeColesData();

  const connection = await mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'shopparazzi_db'
  });

  for (const product of products) {
    // Check if product already exists
    const [existingProduct] = await connection.execute(
      `SELECT id FROM products WHERE name = ? AND volume = ?`,
      [product.name, product.weight]
    );

    let productId;
    if (existingProduct.length > 0) {
      // Product exists, get the productId
      productId = existingProduct[0].id;
    } else {
      // Product does not exist, insert new product
      const [rows] = await connection.execute(
        `INSERT INTO products (name, description, volume, image_url, category) VALUES (?, ?, ?, ?, ?)`,
        [product.name, '', product.weight, product.imageUrl, 'Chocolate']
      );
      productId = rows.insertId;
    }

    // Insert into productprices table
    await connection.execute(
      `INSERT INTO productprices (product_id, store_id, price) VALUES (?, ?, ?)`,
      [productId, 2, product.price]  // Using store_id = 2 for Coles
    );
  }

  console.log('Data inserted successfully');
  await connection.end();
})();
