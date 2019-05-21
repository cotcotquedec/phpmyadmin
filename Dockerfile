FROM phpmyadmin/phpmyadmin
LABEL maintainer="Julien H. <cotcotquedec@gmail.com>"

RUN mkdir /themes

WORKDIR /themes

# FALLEN
RUN wget https://files.phpmyadmin.net/themes/fallen/0.7/fallen-0.7.zip \
  && unzip fallen-0.7.zip \
  && rm fallen-0.7.zip

# METRO
RUN wget https://files.phpmyadmin.net/themes/metro/2.8/metro-2.8.zip \
  && unzip metro-2.8.zip \
  && rm metro-2.8.zip

# METRO
RUN wget https://files.phpmyadmin.net/themes/mhn/1.4/mhn-1.4.zip \
  && unzip mhn-1.4.zip \
  && rm mhn-1.4.zip

# COPY NEW CONFIG
COPY config.inc.php /etc/phpmyadmin/config.inc.php

# Copy main script
COPY run.sh /run.sh
RUN chmod u+rwx /run.sh
