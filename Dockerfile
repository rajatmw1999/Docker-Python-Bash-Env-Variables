FROM ubuntu:20.04

MAINTAINER "Rajat Upadhyay" <rajatis1999@gmail.com>

LABEL name="Docker build for acceptance testing using the robot framework"
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update \
	&& apt install -y software-properties-common \
	&& add-apt-repository ppa:deadsnakes/ppa \
	&& apt update \
	&& apt install -y python3.8 \
	python3-pip


# RUN python ––version
# RUN echo apt install firefox
# RUN echo firefox --version
# RUN apt-get update \
# 	&& apt-get install -y build-essential libssl-dev libffi-dev python-dev \
# 		python3-pip python-dev gcc phantomjs firefox \
# 		xvfb zip wget ca-certificates ntpdate \
# 		libnss3-dev libxss1 libappindicator3-1 libindicator7 gconf-service libgconf-2-4 libpango1.0-0 xdg-utils fonts-liberation \
# 	&& rm -rf /var/lib/apt/lists/*
COPY requirements.txt .
COPY start.sh .
COPY readcsv.py .
# COPY newsh.sh .

# RUN wget https://bootstrap.pypa.io/get-pip.py -o get-pip.py
# RUN python3.8 get-pip.py
RUN python3.8 -m pip install -r requirements.txt


# RUN wget -q https://github.com/mozilla/geckodriver/releases/download/v0.29.1/geckodriver-v0.29.1-linux64.tar.gz \
# 	&& tar xvzf geckodriver-*.tar.gz \
# 	&& rm geckodriver-*.tar.gz 
# RUN export PATH=$PATH:/
# COPY geckodriver .

# RUN mv geckodriver /usr/local/bin \
# 	&& chmod a+x /usr/local/bin/geckodriver

# install chrome and chromedriver in one run command to clear build caches for new versions (both version need to match)
# RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
# 	&& dpkg -i google-chrome*.deb \
# 	&& rm google-chrome*.deb \
#     && wget -q https://chromedriver.storage.googleapis.com/89.0.4389.23/chromedriver_linux64.zip \
# 	&& unzip chromedriver_linux64.zip \
# 	&& rm chromedriver_linux64.zip \
# 	&& mv chromedriver /usr/local/bin \
# 	&& chmod +x /usr/local/bin/chromedriver
# RUN echo "deb http://deb.debian.org/debian/ unstable main contrib non-free" >> /etc/apt/sources.list.d/debian.list
# RUN apt-get update
# RUN apt-get install -y --no-install-recommends --allow-unauthenticated firefox

CMD ["start.sh"]

ENTRYPOINT ["sh"]


# OLDER FILE ----------------------


# FROM ubuntu:16.04

# MAINTAINER "Ipatios Asmanidis" <ypasmk@gmail.com>

# LABEL name="Docker build for acceptance testing using the robot framework"

# RUN apt-get update \
# 	&& apt-get install -y build-essential libssl-dev libffi-dev python-dev \
# 		python-pip python-dev gcc phantomjs firefox \
# 		xvfb zip wget ca-certificates ntpdate \
# 		libnss3-dev libxss1 libappindicator3-1 libindicator7 gconf-service libgconf-2-4 libpango1.0-0 xdg-utils fonts-liberation \
# 	&& rm -rf /var/lib/apt/lists/*
# COPY requirements.txt .
# COPY TC1.robot .
# RUN pip install -r requirements.txt


# # RUN wget -q https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz \
# # 	&& tar xvzf geckodriver-*.tar.gz \
# # 	&& rm geckodriver-*.tar.gz \
# # 	&& mv geckodriver /usr/local/bin \
# # 	&& chmod a+x /usr/local/bin/geckodriver
# # install chrome and chromedriver in one run command to clear build caches for new versions (both version need to match)
# # RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
# # 	&& dpkg -i google-chrome*.deb \
# # 	&& rm google-chrome*.deb \
# #     && wget -q https://chromedriver.storage.googleapis.com/89.0.4389.23/chromedriver_linux64.zip \
# # 	&& unzip chromedriver_linux64.zip \
# # 	&& rm chromedriver_linux64.zip \
# # 	&& mv chromedriver /usr/local/bin \
# # 	&& chmod +x /usr/local/bin/chromedriver
# # RUN echo "deb http://deb.debian.org/debian/ unstable main contrib non-free" >> /etc/apt/sources.list.d/debian.list
# # RUN apt-get update
# # RUN apt-get install -y --no-install-recommends --allow-unauthenticated firefox

# CMD ["TC1.robot"]

# ENTRYPOINT ["robot"]