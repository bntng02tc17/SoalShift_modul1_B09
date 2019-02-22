awk '/cron/ || /CRON/,!/sudo/' /var/log/syslog | awk 'NF <13' >> /home/karinasraya/modul1/syslog5.log
