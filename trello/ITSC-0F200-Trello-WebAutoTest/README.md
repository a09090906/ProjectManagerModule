# README

* Feel free to edit

* Make sure your format is consistent

## 安裝

### Robot Framework On Windows 10 and Python 2.7

1. Install Python 2.7

    * [Download Python](https://www.python.org/downloads)

    * After installing, add install dir and scripts dir to PATH (ex: C:\Python27 and C:\Python27\Scripts) or select "Add python.exe to Path" during installation.

2. Install Robotframework

    * ```pip install robotframework```

    * Verify

        ```C:\Users\user>robot --version```

        ```Robot Framework 3.0 (Python 2.7.12 on win32)```

3. Install Selenium2Library

    * ```pip install robotframework-selenium2library==1.8.0```

    * Verify

        1. ```C:\Users\user>python -m robot.libdoc Selenium2Library version 1.8.0```

        2. Use Selenium2Library in robotframework directly

4. Install RIDE

    * Install wxPython first

        * download from [here](http://sourceforge.net/projects/wxpython/files/wxPython/2.8.12.1/) (檔案名稱：wxPython2.8-win32-unicode-2.8.12.1-py27)  用x64不work

        ```pip install robotframework-ride```

		* Verify

		    ```C:\Users\user>ride.py```

            to see if it can be exectued

5. Install chrome driver

    1. [Download ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver/home)

    2. Include the chromedriver .exe file to PATH (Ex: "D:\Robot Related" if the chromedriver.exe is in it, 也可以直接放進去C:\Python27省事不需額外加PATH)

### Robot Framework On Windows 10 and Python 3(virtualenv)

* note: OS is Window10

* note: Already install Python2.7

* Warning: ride for python3 is not stable version!!

1. Install vituralenv by Python2.7 pip

    * ```pip -U virtualenv```

    * Verify

        ```C:\Users\user>virtualenv --version```

        ```15.2.0```

2. Install Python 3.6.5(32bit)

    * [Download Python](https://www.python.org/downloads)

    * After installing, add install dir and scripts dir to PATH (ex: C:\Users\User\AppData\Local\Programs\Python\Python36-32) or select "Add python.exe to Path" during installation.

3. Build Virtualenv with python3

    * ```virtualenv -p python3 venv```

        ```C:\Users\user\Desktop>mkdir workspace```

        ```C:\Users\user\Desktop>cd workspace```

        ```C:\Users\user\Desktop\workspace>virtualenv -p python3 venv```
	
4. Activate Virtualenv (enter /Scripts)

    * activate

        ```C:\Users\user\Desktop\workspace\venv\Scripts>activate```

        ```(venv)C:\Users\user\Desktop\workspace\Scripts>```

5. Install Robotframework

    * ```pip install robotframework```

    * Verify

        ```(venv)C:\Users\user\Desktop\workspace\Scripts>robot --version```

        ```Robot Framework 3.0.2 (Python 3.6.5 on win32)```
		
6. Install Selenium2Library

    * pip install robotframework-selenium2library

    * Verify

        1. ```(venv)C:\Users\user\Desktop\workspace\Scripts>python -m robot.libdoc Selenium2Library version 3.0.0```

        2. Use Selenium2Library in robotframework directly

7. Install RIDE

    1. ```pip install wxPython```

    2. ```pip install pygments``` (code highlight)

    3. ```pip install -U --pre https://github.com/HelioGuilherme66/RIDE/archive/python3.zip``` (unstable)

    * Verify

        ```(venv)C:\Users\user\Desktop\workspace\Scripts>ride.py```

        to see if it can be exectued
		
8. Install chrome driver

    1. [Download ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver/home)

    2. Include the chromedriver .exe file to PATH (Ex: "D:\Robot Related" if the chromedriver.exe is in it, 也可以直接放進去C:\Python27省事不需額外加PATH)

9. Leave Virtualenv (enter /Scriptes)

    * deactivate

        ```(venv)C:\Users\user\Desktop\workspace\venv\Scripts>deactivate```

        ```C:\Users\user\Desktop\workspace\Scripts>```

* note: next to reactive virtualenv, just do step 4
