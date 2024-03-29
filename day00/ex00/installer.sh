if [ "$1" =  "install-python" ]; then
   var=$(python -V) &> /dev/null
   if [ "$var" = "Python 3.7.4" ]; then
       echo "Python is already installed, do you want to reinstall it ?"
       printf '%s' "[yes|no]> "
       read answer
       if [ $answer = "yes" ]; then
           rm -rf /goinfre/python
           echo "Python has been removed."
           export PATH="/goinfre/python/bin:$PATH"
           curl -o miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh &> /dev/null
           bash miniconda.sh -b -p /goinfre/python &> /dev/null
           rm miniconda.sh
           echo "Python has been installed."
       fi
       if [ $answer = "no" ]; then
           echo "exit."
       fi
   else
       export PATH="/goinfre/python/bin:$PATH"
       curl -o miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh &> /dev/null
       bash miniconda.sh -b -p /goinfre/python &> /dev/null
       rm miniconda.sh
       echo "Python has been installed."
   fi
fi
