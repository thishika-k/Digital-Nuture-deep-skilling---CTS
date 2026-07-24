from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import os
import time

# Launch Chrome
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))
driver.maximize_window()

# Open website
driver.get("https://www.google.com")

time.sleep(2)

# Create screenshots folder if it doesn't exist
os.makedirs("Screenshots", exist_ok=True)

# Save screenshot
driver.save_screenshot("Screenshots/08_screenshot_google.png")

print("Screenshot saved successfully!")

time.sleep(2)

driver.quit()