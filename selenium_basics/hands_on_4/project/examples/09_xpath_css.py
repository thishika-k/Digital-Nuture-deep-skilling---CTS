from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time

driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))
driver.maximize_window()

driver.get("https://the-internet.herokuapp.com/login")

time.sleep(2)

# XPath
username = driver.find_element(By.XPATH, "//input[@id='username']")

# CSS Selector
password = driver.find_element(By.CSS_SELECTOR, "#password")

# XPath Button
login = driver.find_element(By.XPATH, "//button[@type='submit']")

username.send_keys("tomsmith")
password.send_keys("SuperSecretPassword!")

time.sleep(1)

login.click()

time.sleep(3)

print("Login Successful!")
print(driver.current_url)

driver.quit()