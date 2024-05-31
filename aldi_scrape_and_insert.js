const puppeteer = require('puppeteer');
const mysql = require('mysql2/promise');

(async () => {
  const browser = await puppeteer.launch({ headless: false });
  const page = await browser.newPage();

  await page.setDefaultNavigationTimeout(60000);
  await page.goto('https://www.aldi.com.au/groceries/pantry/chocolate/');

  await page.waitForSelector('.box--description--header', { visible: true });

  const productDetails = await page.$$eval('.box--description--header', (elements) => {
    const products = [];
    const weightRegex = /(\d+g)/;
    const priceRegex = /\$(\d+\.\d+)/;
    elements.forEach(element => {
      const text = element.textContent.trim();
      const weightMatch = text.match(weightRegex);
      const weight = weightMatch ? weightMatch[0] : 'Unknown';
      const name = text.replace(weightRegex, '').trim();
      const priceElement = element.nextElementSibling.querySelector('.box--baseprice');
      const priceText = priceElement ? priceElement.textContent.trim() : '';
      const priceMatch = priceText.match(priceRegex);
      const basePrice = priceMatch ? parseFloat(priceMatch[1]) : 0;
      const price = weight !== 'Unknown' ? (parseInt(weight) * (basePrice / 100)).toFixed(2) : 'Unknown';
      const imageElement = element.closest('.box.m-text-image').querySelector('.box--image-container img');
      const imageUrl = imageElement ? imageElement.getAttribute('src') : 'Unknown';
      products.push({ name: name, weight: weight, price: price, imageUrl: imageUrl });
    });
    return products;
  });

  const connection = await mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'shopparazzi_db'
  });

  for (const product of productDetails) {
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
      [productId, 1, product.price]  // Using store_id = 1 for Aldi
    );
  }

  console.log('Data inserted successfully');
  await connection.end();
  await browser.close();
})();
