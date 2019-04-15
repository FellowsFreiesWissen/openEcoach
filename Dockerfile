FROM python:3

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql \
        apache2 \
        libpq-dev \
        zlib1g-dev \
        libsasl2-dev \
        libssl-dev \
        swig \
        libapache2-mod-xsendfile \
        libapache2-mod-wsgi \
        junit \
        junit4 \
        dejagnu \
        gcj-jdk \
        git-core \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
COPY Praktomat/requirements.txt ./
RUN python3 -m venv --system-site-packages env/ && . env/bin/activate
RUN pip install -r requirements.txt
COPY Praktomat .
RUN mkdir data
RUN ./src/manage-devel.py migrate --noinput
COPY adddemouser.py ./src/utilities/management/commands/
RUN ./src/manage-devel.py adddemouser
EXPOSE 8000
CMD ["python", "./src/manage-devel.py", "runserver", "0.0.0.0:8000"]