# selenium 4
from selenium import webdriver
from selenium.webdriver.chrome.service import Service as ChromiumService
from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.core.utils import ChromeType
from selenium.webdriver.firefox.service import Service as FirefoxService
from webdriver_manager.firefox import GeckoDriverManager
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.service import Service as ChromeService
from selenium.webdriver.edge.service import Service as EdgeService
from webdriver_manager.microsoft import EdgeChromiumDriverManager

import os



def get_project_root():
    return os.path.dirname(os.path.abspath("requirements.txt"))


def ff_instacia_start():
    fp = webdriver.FirefoxProfile()
    fp.set_preference("geo.prompt.testing",True)
    fp.set_preference("geo.prompt.testing.allow",True)
    fp.set_preference("browser.download.folderList",2)
    fp.set_preference("browser.download.manager.showWhenStarting",False)
    # fp.set_preference("browser.download.dir",path)
    fp.set_preference("browser.helperApps.neverAsk.savewebdriver-managerToDisk",'application/xls;text/csv')
    fp.update_preferences()
    fp.headless = True
    if os.name == 'nt':
        driver = webdriver.Firefox(service=FirefoxService(executable_path=GeckoDriverManager(path = get_project_root() + "/drivers/").install()))
        driver.close()
    return fp


def ch_instancia_start():
    options = webdriver.ChromeOptions()
    options.add_argument('allow-elevated-browser')
    options.add_argument('no-sandbox')
    options.add_argument('allowed-ips')
    options.add_argument('disable-gpu')
    options.add_argument('disable-notifications')
    options.add_argument('disable-setuid-sandbox')
    options.add_argument('disable-dev-shm-usage')
    options.add_argument('disable-extensions')
    options.add_argument('headless')
    if os.name == 'nt':
        driver = webdriver.Chrome(service= \
            ChromeService(executable_path=ChromeDriverManager(chrome_type=ChromeType.BRAVE,
                            path = get_project_root() + "/drivers/").install()),
                            options=options)
        driver.close
    return options


def edge_instancia_start():
    options = webdriver.EdgeOptions()
    options.add_argument('allow-elevated-browser')
    options.add_argument('no-sandbox')
    options.add_argument('allowed-ips')
    options.add_argument('disable-gpu')
    options.add_argument('disable-notifications')
    options.add_argument('disable-setuid-sandbox')
    options.add_argument('disable-dev-shm-usage')
    options.add_argument('disable-extensions')
    options.add_argument('headless')
    if os.name == 'nt':
        driver = webdriver.Edge(service= \
            EdgeService(executable_path=EdgeChromiumDriverManager(
                            path = get_project_root() + "/drivers/").install()),
                            options=options)
        driver.close
    return options

print(get_project_root())
