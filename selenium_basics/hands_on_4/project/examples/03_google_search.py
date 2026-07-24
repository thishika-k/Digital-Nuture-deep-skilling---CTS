from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from webdriver_manager.chrome import ChromeDriverManager
import time

# Launch Chrome
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))

driver.maximize_window()

# Open Google
driver.get("https://www.google.com")

time.sleep(2)

# Find the search box
search_box = driver.find_element(By.NAME, "q")

# Type into the search box
search_box.send_keys("Selenium Python")

time.sleep(2)

# Press Enter
search_box.send_keys(Keys.ENTER)

time.sleep(5)

print("Current Title:", driver.title)

driver.quit()