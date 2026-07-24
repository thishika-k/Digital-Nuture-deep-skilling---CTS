from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time

# Launch Chrome
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))
driver.maximize_window()

# Open website
driver.get("https://the-internet.herokuapp.com/login")

time.sleep(2)

# Find username textbox
username = driver.find_element(By.ID, "username")

# Find password textbox
password = driver.find_element(By.ID, "password")

# Find login button
login_btn = driver.find_element(By.CLASS_NAME, "radius")

print("Username Field :", username.tag_name)
print("Password Field :", password.tag_name)
print("Login Button :", login_btn.text)

time.sleep(3)

driver.quit()