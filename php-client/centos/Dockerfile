FROM centos:7

RUN yum -y groupinstall "Development Tools"
RUN yum -y install epel-release

RUN yum-config-manager --add-repo https://download.opensuse.org/repositories/home:knonomura/CentOS_7/home:knonomura.repo
RUN yum -y install griddb-c-client

RUN yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum -y install --enablerepo=remi,remi-php70 php php-devel

WORKDIR /root
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

RUN composer require griddb/php-client

RUN echo "extension=/root/vendor/griddb/php-client/src/griddb_php_client.so" >> /etc/php.ini

RUN cp vendor/griddb/php-client/sample/sample1.php .
CMD php sample1.php  239.0.0.1 31999 dockerGridDB admin admin
