check_browser(){
	which $1
	if [ $? -eq 0 ]
	then
		echo "[*] $1 Browser is installed"
	fi
}
which unzip
if [ $? -eq 1 ]
then
	echo "[-] Please install \"unzip\" command."
	sleep 0.001 #idk lol
	exit
fi
pip install -r requirements.txt
clear
check_browser chrome
if [ $? -eq 0 ] #0 return code means no error
then
    echo "[+] Installing chromedriver in ~ folder"
    $cwd=pwd
    #cd ~
    wget https://chromedriver.storage.googleapis.com/98.0.4758.102/chromedriver_linux64.zip #replace this with your chrome version
    unzip chromedriver_linux64.zip
    rm chromedriver_linux64.zip 
    #cd $cwd
fi
check_browser firefox
if [ $? -eq 0 ] #0 return code means no error
then
    echo "[+] Installing geckodriver in ~ folder"
    $cwd=pwd
    #cd ~
    wget https://github.com/mozilla/geckodriver/releases/download/v0.30.0/geckodriver-v0.30.0-linux32.tar.gz
    tar -xf geckodriver-v0.30.0-linux32.tar.gz
    rm geckodriver-v0.30.0-linux32.tar.gz
    #cd $cwd
fi



echo python Hazard.py > start.sh
chmod 777 start.sh
