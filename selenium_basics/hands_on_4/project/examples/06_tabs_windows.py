from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time

# Launch Chrome
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))
driver.maximize_window()

# Open first website
driver.get("https://www.google.com")
print("First Tab:", driver.title)

time.sleep(2)

# Open a new tab
driver.switch_to.new_window('tab')

# Open second website
driver.get("https://github.com")
print("Second Tab:", driver.title)

time.sleep(2)

# Get all window handles
tabs = driver.window_handles

# Switch back to first tab
driver.switch_to.window(tabs[0])
print("Back to:", driver.title)

time.sleep(2)

# Switch to second tab
driver.switch_to.window(tabs[1])
print("Again on:", driver.title)

time.sleep(2)

driver.quit()