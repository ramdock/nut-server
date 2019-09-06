FROM python:3.6-buster

MAINTAINER marcel@marquez.fr

#add default values for credentials args
ENV ID=guest
ENV PASSWORD=guest

RUN git clone https://github.com/blawar/nut.git /root/nut --depth 1 && \
    cd /root/nut && \
    pip3 install colorama pyopenssl requests tqdm unidecode Pillow BeautifulSoup4 urllib3 Flask pyusb pyqt5 clock google-api-python-client

COPY /entrypoint.sh /
COPY conf /root/nut/conf

# add custom id and password to secure nut-server
RUN echo -e "\n$ID|$PASSWORD" >> /root/nut/conf/users.conf

RUN apt-get update && apt-get -y install cron

COPY scraping-cron /etc/cron.d/scraping-cron
RUN chmod 0644 /etc/cron.d/scraping-cron && \
    crontab /etc/cron.d/scraping-cron

EXPOSE 9000

ENTRYPOINT ["sh", "/entrypoint.sh", "cron", "-f"]
