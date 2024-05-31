const puppeteer = require('puppeteer');
const xlsx = require('xlsx');

// Function to format price with dollar sign and two decimal places
function formatPrice(price) {
    if (price === 'N/A') return price;
    const number = parseFloat(price.replace(/[^0-9.]/g, ''));
    return isNaN(number) ? 'N/A' : `$${number.toFixed(2)}`;
}

async function scrapeWoolworthsData() {
    try {
        const browser = await puppeteer.launch({ headless: false }); // Launch Puppeteer in non-headless mode
        const page = await browser.newPage();
        await page.goto('https://www.woolworths.com.au/shop/browse/snacks-confectionery/confectionery/chocolate-blocks');

        // Extract product names, prices, and image URLs without waiting for selectors
        const products = await page.evaluate(() => {
            const formatPrice = (price) => {
                if (price === 'N/A') return price;
                const number = parseFloat(price.replace(/[^0-9.]/g, ''));
                return isNaN(number) ? 'N/A' : `$${number.toFixed(2)}`;
            };

            const productsData = [];
            const nameElements = document.querySelectorAll('.title');
            const priceElements = document.querySelectorAll('.price-container span');

            nameElements.forEach((nameElement, index) => {
                const name = nameElement.textContent.trim();
                const price = priceElements[index] ? formatPrice(priceElements[index].textContent.trim()) : 'N/A';
                const imageElement = nameElement.closest('.shelfProductTile-content').querySelector('img');
                const imageSrc = imageElement ? imageElement.getAttribute('src') : 'N/A';

                productsData.push({ name, price, imageUrl: imageSrc });
            });

            return productsData;
        });

        await browser.close();

        return products;
    } catch (error) {
        console.error('Error scraping Woolworths data:', error);
        throw error;
    }
}

function readProductsFromExcel(filePath) {
    const formatPrice = (price) => {
        const number = parseFloat(price);
        return isNaN(number) ? 'N/A' : `$${number.toFixed(2)}`;
    };

    const workbook = xlsx.readFile(filePath);
    const sheetName = workbook.SheetNames[0];
    const worksheet = workbook.Sheets[sheetName];
    const products = xlsx.utils.sheet_to_json(worksheet);

    // Format the prices
    products.forEach(product => {
        product.price = formatPrice(product.price);
    });

    return products;
}

async function main() {
    try {
        const products = await scrapeWoolworthsData();

        if (products.length === 0) {
            console.log('No products found from Woolworths, reading from WooliesProducts.xlsx');
            const backupProducts = readProductsFromExcel('C:\\Users\\desha\\OneDrive\\Desktop\\scraper\\WooliesProducts.xlsx');
            console.log('Backup products:', backupProducts);
        } else {
            console.log('Woolworths products:', products);
        }
    } catch (error) {
        console.error('Error:', error);
    }
}

main();
