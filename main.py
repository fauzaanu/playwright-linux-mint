import asyncio
from playwright.async_api import async_playwright

async def run(playwright):
    # Launch a browser (Chromium in this case)
    browser = await playwright.chromium.launch(
        headless=False,
    )
    # Open a new page
    page = await browser.new_page()
    # Navigate to the webpage
    await page.goto('https://example.com')
    # Take a screenshot
    await page.screenshot(path='/usr/src/app/docker-store/example.png')
    # Close the browser
    await browser.close()

async def main():
    async with async_playwright() as playwright:
        await run(playwright)

# Run the script
asyncio.run(main())
