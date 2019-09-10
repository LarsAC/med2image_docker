FROM python:3.6.9-alpine

RUN echo "http://dl-cdn.alpinelinux.org/alpine/latest-stable/main" > /etc/apk/repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/latest-stable/community" > /etc/apk/repositories

RUN apk --no-cache --update-cache add gcc gfortran python python-dev py-pip build-base wget freetype-dev libpng-dev jpeg-dev zlib-dev openblas-dev
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h

COPY requirements.txt /
RUN pip install -r /requirements.txt

WORKDIR /app

ENTRYPOINT ["med2image", "-d", "/output", "-i"]
CMD ["/input/input.dcm"]
