from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time

# Configure Chrome
service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service)

# Maximize the browser
driver.maximize_window()

# Open Google
driver.get("https://www.google.com")
print("Title:", driver.title)

time.sleep(2)

# Navigate to GitHub
driver.get("https://github.com")
print("Title:", driver.title)

time.sleep(2)

# Go back
driver.back()

time.sleep(2)

# Go forward
driver.forward()

time.sleep(2)

# Refresh the page
driver.refresh()

time.sleep(2)

# Close the browser
driver.quit()