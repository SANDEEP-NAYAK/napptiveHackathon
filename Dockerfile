FROM ubuntu:latest

# Install dependencies
RUN sudo apt-get update -y &&\
    sudo apt-get install -y apache2 && \
    # sudo apt install apache2-bin &&\
    sudo apt-get install wget -y && \
    sudo apt-get install unzip -y
# https://www.youtube.com/watch?v=4pRo6Ud1JI8&ab_channel=AOSNote
# change directory
# RUN cd /var/www/html
RUN mkdir ~/Desktop/napProj/

# download webfiles
RUN wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=11D4ELPuYTxDdVaZSsFXaoadhtaYV5fy2' -O main.zip

# unzip folder
RUN unzip main.zip

# copy files into html directory
RUN sudo cp -r test_file/* /var/www/html/

# remove unwanted folder
# RUN sudo rm -rf main.zip

# exposes port 80 on the container
EXPOSE 80

# set the default application that will start when the container start
# ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
