from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from webdriver_manager.chrome import ChromeDriverManager

driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))
driver.maximize_window()

driver.get("https://the-internet.herokuapp.com/login")

wait = WebDriverWait(driver, 10)

username = wait.until(
    EC.presence_of_element_located((By.ID, "username"))
)

password = driver.find_element(By.ID, "password")
login = driver.find_element(By.CLASS_NAME, "radius")

username.send_keys("tomsmith")
password.send_keys("SuperSecretPassword!")

login.click()

success = wait.until(
    EC.presence_of_element_located((By.ID, "flash"))
)

print(success.text)

driver.quit()