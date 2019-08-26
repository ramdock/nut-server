FROM python:3.6-buster

RUN  apt update && apt install -y libgl1-mesa-glx

RUN git clone https://github.com/blawar/nut.git /root/nut --depth 1 && \
    cd /root/nut && \
    pip3 install colorama pyopenssl requests tqdm unidecode Pillow BeautifulSoup4 urllib3 Flask pyusb pyqt5 clock

COPY /entrypoint.sh /
COPY conf /root/nut/conf

EXPOSE 9000

ENTRYPOINT ["sh", "/entrypoint.sh"]