# inodealert
Bash Inode Alert Script that sends an email (requires sendmail)
Upload to your Linux box ensure you have +x permission on file then schedule crontab to execute the file e.g:
chmod +x inodeAlertScript.sh

To run itself type:
bash inodeAlertScript.sh

To edit crontab (example as root user):
crontab -e -u root

Then in editor (I always add PATH variable in here to ensure that you can use sendmail).  Path could be different on your machine to see what your PATH variable is type in a new shell prompt:

echo $PATH

Then replace below with your PATH value and add to crontab 

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

Example crontab below runs every hour and assumes file has been uploaded to /home/user/scripts/

0 * * * * /home/user/scripts/inodeAlertScript.sh >/dev/null 2>&1
