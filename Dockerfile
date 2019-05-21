FROM phpmyadmin/phpmyadmin
LABEL maintainer="Julien H. <cotcotquedec@gmail.com>"


# FALLEN
RUN wget https://files.phpmyadmin.net/themes/fallen/0.7/fallen-0.7.zip \
  && unzip fallen-0.7.zip \
  && mv fallen /var/www/html/themes/ \
  && rm fallen-0.7.zip

# METRO
RUN wget https://files.phpmyadmin.net/themes/metro/2.8/metro-2.8.zip \
  && unzip metro-2.8.zip \
  && mv metro /var/www/html/themes/ \
  && rm metro-2.8.zip

# METRO
RUN wget https://files.phpmyadmin.net/themes/mhn/1.4/mhn-1.4.zip \
  && unzip mhn-1.4.zip \
  && mv mhn /var/www/html/themes/ \
  && rm mhn-1.4.zip

COPY config.inc.php /etc/phpmyadmin/config.inc.php
