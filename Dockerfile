FROM ubuntu

RUN apt-get update

ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt install -y python3
RUN apt install -y python3-pip
RUN mkdir weatherappfolder
WORKDIR /weatherappfolder
COPY . /weatherappfolder
COPY ./requirements.txt ./
ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod a+x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
RUN pip install -r requirements.txt
