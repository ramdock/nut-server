FROM python:3.8.0b3-buster

RUN git clone https://github.com/blawar/nut.git /root/nut --depth 1 && \
    cd /root/nut && \
    pip3 install colorama pyopenssl requests tqdm unidecode Pillow BeautifulSoup4 urllib3 Flask pyusb pyqt5

COPY /entrypoint.sh /
COPY conf /root/nut/conf

EXPOSE 9000
ENTRYPOINT ["/entrypoint.sh"]