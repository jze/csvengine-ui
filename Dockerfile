FROM ubuntu:16.04

RUN apt-get update && apt-get install -y python python-pip git python-setuptools python-numpy python-pathlib python-flask python-enum python-yaml python-structlog python-future python-unicodecsv rpl && apt-get install -y --no-install-recommends python-pandas

RUN pip install git+git://github.com/sebneu/anycsv.git
RUN pip install faststat
RUN pip install urlnorm
RUN pip install git+git://github.com/ODInfoBiz/pyyacp.git@v1.0

WORKDIR /app

COPY csvengine/ csvengine/ 
COPY setup.py setup.py 
COPY runner runner
COPY template_config.yaml template_config.yaml

RUN python setup.py install

EXPOSE 2340

ENTRYPOINT /app/runner -c /app/template_config.yaml
