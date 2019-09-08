FROM python:3.6.9-slim-buster

MAINTAINER marcel@marquez.fr

#add default values for credentials args
ENV ID=guest
ENV PASSWORD=guest

RUN apt-get update && apt-get -y install cron git && \
    git clone https://github.com/blawar/nut.git /root/nut --depth 1 && \
    cd /root/nut && \
    pip3 install colorama pyopenssl requests tqdm unidecode Pillow BeautifulSoup4 urllib3 Flask pyusb pyqt5 clock google-api-python-client google-auth-oauthlib

COPY /entrypoint.sh /
COPY /scraping-cron /etc/cron.d/scraping-cron
COPY conf /root/nut/conf

# add custom id and password to secure nut-server
RUN echo -e "\n$ID|$PASSWORD" >> /root/nut/conf/users.conf

#add cron task to crontab
RUN chmod 0644 /etc/cron.d/scraping-cron && \
    crontab /etc/cron.d/scraping-cron

EXPOSE 9000

ENTRYPOINT ["sh", "/entrypoint.sh", "cron", "-f"]
