# Hands-On 2: Introduction to Selenium

## Objective

Understand Selenium, its architecture, components, browser drivers, advantages, limitations, and its role in web automation testing.

---

## What is Selenium?

Selenium is an open-source automation tool used to test web applications across different browsers and operating systems. It supports multiple programming languages including Python, Java, C#, and JavaScript.

---

## Selenium Components

### Selenium WebDriver

* Automates browser interactions.
* Executes test scripts directly in the browser.
* Supports Chrome, Firefox, Edge, Safari, and other browsers.

### Selenium IDE

* Browser extension for recording and replaying test cases.
* Useful for learning Selenium and creating simple automation scripts.

### Selenium Grid

* Executes tests on multiple browsers and machines simultaneously.
* Supports parallel and distributed test execution.

---

## Selenium Architecture

The automation flow is:

Test Script → Selenium WebDriver → Browser Driver → Browser

* The test script sends commands to WebDriver.
* WebDriver communicates with the browser driver.
* The browser driver controls the browser and returns the results.

---

## Browser Drivers

Browser drivers act as a bridge between Selenium WebDriver and the browser.

Examples:

* ChromeDriver – Google Chrome
* GeckoDriver – Mozilla Firefox
* EdgeDriver – Microsoft Edge
* SafariDriver – Apple Safari

---

## Advantages of Selenium

* Open source and free to use.
* Supports multiple browsers.
* Supports multiple programming languages.
* Cross-platform compatibility.
* Integrates with testing frameworks such as pytest.
* Can be integrated with CI/CD tools.

---

## Limitations of Selenium

* Supports only web applications.
* No built-in reporting.
* No built-in test management.
* Requires programming knowledge.
* Does not automate desktop applications.

---

## Selenium vs Manual Testing

| Manual Testing                   | Selenium Automation              |
| -------------------------------- | -------------------------------- |
| Performed manually               | Executed using scripts           |
| Slower                           | Faster                           |
| Suitable for exploratory testing | Suitable for repetitive testing  |
| Higher human effort              | Reduced manual effort            |
| Time-consuming                   | Efficient for regression testing |

---

## Learning Outcome

* Understood Selenium architecture.
* Learned the purpose of WebDriver, Selenium IDE, and Selenium Grid.
* Understood the role of browser drivers.
* Identified the advantages and limitations of Selenium.
* Compared Selenium automation with manual testing.
