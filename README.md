# phpmyadmin

Add official theme to phpmyadmin docker image

You can find github of the phpmyadmin original build : https://github.com/phpmyadmin/docker
You can find the original image on dockerhub : https://hub.docker.com/r/phpmyadmin/phpmyadmin


## Build it !


```bash
# CLONE 
git clone https://github.com/cotcotquedec/phpmyadmin.git

# WORKING DIR
cd phpmyadmin

# BUILD
docker build -t phpmyadmin .
```

## Docker

From bash :
```bash
docker run --name myadmin -d -e PMA_THEME=metro -p 8080:80 phpmyadmin/phpmyadmin
```

Docker-compose
```yaml
phpmyadmin:
    image: cotcotquedec/phpmyadmin
    environment:
        PMA_THEME: metro
    restart: always
    ports:
        - "8080:80"
```



## THEME

To select a default theme you can use ENV variable PMA_THEME 
Current new values are :
 - fallen
 - mhn
 - metro

### Fallen

![Fallen](https://www.phpmyadmin.net/static/images/themes/fallen.png)


### mhn

![mhn](https://www.phpmyadmin.net/static/images/themes/mhn.png)


### Metro

![metro](https://www.phpmyadmin.net/static/images/themes/metro.png)
