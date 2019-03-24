# WebWatcher
WebWatcher is forked from the LogWatcher project by adding a wget command allowing you to monitor a webpage to see if it has changed.

WebWatcher.sh is meant to run as a cron job within cPanel on a webhost.  If you schedule the cron job to run every minute you essentially have continuous monitoring and alerting.  If you added a grep phrase into the WebWatcher scripts you could alert for specific user behavior.

From the LogWatcher project:

LogWatcher is a utility to perform very simple automated system monitoring and alerting.  It is an ideal solution to use in conjunction with a web app that has a sound event logging architecture implemented.  LogWatcher simply watches an error log file for any anomalous behavior.  If someone attempts a log in, attempts to read the database, hack the URL, or any other adverse behavior that is landing in an error log file, LogWatcher can send an email alert to make you aware.

WebWatcher assumes direct access to the web log and it uses the webhost's settings to send an email using a terminal utility called mailx.  Of course ,if you used your cell carrier's SMS gateway you could receive text alerts.

