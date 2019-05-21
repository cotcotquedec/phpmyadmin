FROM phpmyadmin/phpmyadmin
LABEL maintainer="Julien H. <cotcotquedec@gmail.com>"

# THEME
RUN mkdir /themes

# FALLEN
RUN wget https://files.phpmyadmin.net/themes/fallen/0.7/fallen-0.7.zip \
  && unzip fallen-0.7.zip \
  && mv fallen /themes/ \
  && rm fallen-0.7.zip

# METRO
RUN wget https://files.phpmyadmin.net/themes/metro/2.8/metro-2.8.zip \
  && unzip metro-2.8.zip \
  && mv metro /themes/ \
  && rm metro-2.8.zip

# METRO
RUN wget https://files.phpmyadmin.net/themes/mhn/1.4/mhn-1.4.zip \
  && unzip mhn-1.4.zip \
  && mv mhn /themes/ \
  && rm mhn-1.4.zip

# COPY NEW CONFIG
COPY config.inc.php /etc/phpmyadmin/config.inc.php

RUN sed -i 's/exec.*//g' /run.sh \
  && echo "cp -R /themes/* /var/www/html/themes/ " >> /run.sh \
  && echo "exec \"\$@\"" >> /run.sh
