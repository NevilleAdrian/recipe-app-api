# Shell script file
#!/bin/sh

# Any command that failsin the next command we add to the script, it's going to fail the whole script
set -e

# Commands for starting our service
python manage.py wait_for_db

# This will collect all our static files and it will put them in the configured static files directory
#  When we start our application all static files used to run our project are copied to the same directory, so we can make the direcotry accessible by the nginx service
python manage.py collectstatic --noinput

# Used to run any migrations automatically when we start our app
# When you make changes to the db it's good to run this command
python manage.py migrate

# Socket 9000 runs it on a tcp socket on port 9000
# Workers 4 sets 4 distinct workers, 4 is a good number but it can be changed
# Master mens the uswgi daemon will be the master thread
# Enable threads which means if we use any multithreading we can use it through the wsgi service
#  Module app.wgi helps to run app app wsgi, it tells the uwsgi service thats the entery to thr project
uswgi --socket :9000 --workers 4 --master --enable-threads --module app.wsgi

