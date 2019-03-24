#!/bin/bash
# v.1; GNU - GPL
# Author: Kyle Pott, Caleb Lemoine
# This script is designed to be run as a cron job on a web host
# This script assumes unauthenticated access to the web_log file.
# Download a website and check if it has changed.
# If it has changed, then send an email.
# Here is what you can enter to schedule the cron job on your web host: 
# /bin/sh /home/username/public_html/webwatcher.sh

# create and rename the source file
# if the source file does not exist a warning is displayed, but the script will keep processing just fine.
# Download the website file.
touch web_log
# The c flag is used to continue in case of issues downloading
# The O flag is to pipe the output of the file to web_log so we can do our comparison logic.
# If you install torsocks and add the torsocks command before wget below, you can use anonymous 
# web monitoring
wget -cO - websitetowatch.com > web_log #Edit this to match the website page you want to watch
cp web_log web_log_source
cp ~/public_html/path/to/your/web_log web_log #Edit this to be the path to your error_log

# comparison logic
# https://stackoverflow.com/questions/8139885/shellscript-action-if-two-files-are-different
if ! cmp web_log web_log_source > /dev/null 2>&1
then
# email logic
echo "The Website changed at $(date)" | mailx youremailaddress@email.com
fi

# Some webhosts send you a confirmation email after a cron job runs.
# That would not be practicable if you set the cron job to run every minute. 
# So we add this to the bottom of our file to suppress automated cron notification.
> /dev/null 2>&1
