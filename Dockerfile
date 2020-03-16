FROM python:3.8
RUN cat /etc/issue
RUN pip install vega altair altair_saver biopython jupyter selenium
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash - && \
    apt-get install -y nodejs
# it technically needs a package.json but doesnt use it for npm ci. So the contents of package.json are: {}
COPY package.json /usr/package.json 
COPY package-lock.json /usr/package-lock.json
RUN npm --global config set user root && \
    npm --global ci
ENV PATH=$PATH:/usr/node_modules/vega-cli/bin:/usr/node_modules/vega-lite/bin
# allow root to run notebook
COPY jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py
