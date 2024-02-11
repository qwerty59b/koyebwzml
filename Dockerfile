FROM mysterysd/wzmlx:heroku

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app
RUN apt-get install -y ffmpeg

COPY . .
RUN pip3 install --no-cache-dir -r requirements.txt
