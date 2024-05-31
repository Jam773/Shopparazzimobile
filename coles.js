const puppeteer = require('puppeteer');

async function scrapeColesData() {
    try {
        const browser = await puppeteer.launch({ headless: false }); // Launch Puppeteer in non-headless mode
        const page = await browser.newPage();
        await page.goto('https://www.coles.com.au/browse/pantry/confectionery/chocolate-blocks');

        // Wait for the elements to be available
        await page.waitForSelector('.LinesEllipsis.product__title');
        await page.waitForSelector('.price__value');

        // Extract product names, prices, and image URLs
        const products = await page.evaluate(() => {
            const productsData = [];
            const nameElements = document.querySelectorAll('.LinesEllipsis.product__title');
            const priceElements = document.querySelectorAll('.price__value');
            const imageElements = document.querySelectorAll('img[data-testid="product-image"]');

            nameElements.forEach((nameElement, index) => {
                const name = nameElement.textContent.trim();
                const price = priceElements[index].textContent.trim();
                const imageSrc = imageElements[index].getAttribute('src');
                const weightMatch = name.match(/\|\s*(\d+(\.\d+)?)\s*(g|kg|ml|L)/i);
                let weight = null;
                if (weightMatch) {
                    weight = weightMatch[1] + weightMatch[3].toLowerCase();
                }
                // Remove the weight part from the name
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

scrapeColesData()
    .then(products => {
        console.log('Coles products:', products);
    })
    .catch(error => {
        console.error('Error:', error);
    });
