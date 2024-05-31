const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch({ headless: false });
  const page = await browser.newPage();

  // Increase the navigation timeout to 60 seconds (60000 milliseconds)
  await page.setDefaultNavigationTimeout(60000);

  // Go to the website URL
  await page.goto('https://www.aldi.com.au/groceries/pantry/chocolate/');

  // Wait for product name containers to be visible
  await page.waitForSelector('.box--description--header', { visible: true });

  // Extract product names, weights, and prices
  const productDetails = await page.$$eval('.box--description--header', (elements) => {
    const products = [];
    const weightRegex = /(\d+g)/;
    const priceRegex = /\$(\d+\.\d+)/;
    elements.forEach(element => {
      const text = element.textContent.trim();
      const weightMatch = text.match(weightRegex);
      const weight = weightMatch ? weightMatch[0] : 'Unknown'; // Retain 'g' unit if found, otherwise mark as 'Unknown'
      const name = text.replace(weightRegex, '').trim(); // Remove weight from the name
      const priceElement = element.nextElementSibling.querySelector('.box--baseprice');
      const priceText = priceElement ? priceElement.textContent.trim() : '';
      const priceMatch = priceText.match(priceRegex);
      const basePrice = priceMatch ? parseFloat(priceMatch[1]) : 0; // Extract base price
      const price = weight !== 'Unknown' ? ('$' + (parseInt(weight) * (basePrice / 100)).toFixed(2)) : 'Unknown'; // Calculate total price if weight is known
      const imageElement = element.closest('.box.m-text-image').querySelector('.box--image-container img');
      const imageUrl = imageElement ? imageElement.getAttribute('src') : 'Unknown'; // Extract image URL
      products.push({ name: name, weight: weight, price: price, imageUrl: imageUrl });
    });
    return products;
  }, '.box--price');

  console.log(productDetails);

  // You can close the browser manually when done
  await browser.close();
})();
