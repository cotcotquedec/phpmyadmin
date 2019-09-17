FROM phpmyadmin/phpmyadmin
LABEL maintainer="Julien H. <cotcotquedec@gmail.com>"


# UPGRADE
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y wget curl unzip && \
    apt-get -q autoremove  && \
    apt-get -q clean -y  && \
    rm -rf /var/lib/apt/lists/*  && \
    rm -f /var/cache/apt/*.bin

# THEME
RUN mkdir /themes

# FALLEN
RUN wget https://files.phpmyadmin.net/themes/fallen/0.7.1/fallen-0.7.1.zip \
  && unzip fallen-0.7.1.zip \
  && mv fallen /themes/ \
  && rm fallen-0.7.1.zip

# METRO
RUN wget https://files.phpmyadmin.net/themes/metro/2.8.1/metro-2.8.1.zip \
  && unzip metro-2.8.1.zip \
  && mv metro /themes/ \
  && rm metro-2.8.1.zip

# MHN
RUN wget https://files.phpmyadmin.net/themes/mhn/1.4.1/mhn-1.4.1.zip \
  && unzip mhn-1.4.1.zip \
  && mv mhn /themes/ \
  && rm mhn-1.4.1.zip

# COPY NEW CONFIG
COPY config.inc.php /etc/phpmyadmin/config.inc.php

RUN sed -i 's/exec.*//g' /docker-entrypoint.sh \
  && echo "cp -R /themes/* /var/www/html/themes/ " >> /docker-entrypoint.sh \
  && echo "exec \"\$@\"" >> /docker-entrypoint.sh
