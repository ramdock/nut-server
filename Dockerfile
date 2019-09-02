FROM python:3.6-buster

RUN git clone https://github.com/blawar/nut.git /root/nut --depth 1 && \
    cd /root/nut && \
    pip3 install colorama pyopenssl requests tqdm unidecode Pillow BeautifulSoup4 urllib3 Flask pyusb pyqt5 clock

COPY /entrypoint.sh /

# add custom id and password to secure nut-server
RUN echo ""$ID"|"$PASSWORD"" >> /conf/users.conf

COPY conf /root/nut/conf

EXPOSE 9000

ENTRYPOINT ["sh", "/entrypoint.sh"]
