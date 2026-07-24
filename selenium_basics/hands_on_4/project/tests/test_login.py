from pages.login_page import LoginPage

def test_login(driver):

    driver.get("https://the-internet.herokuapp.com/login")

    login = LoginPage(driver)

    login.login(
        "tomsmith",
        "SuperSecretPassword!"
    )

    assert "secure" in driver.current_url