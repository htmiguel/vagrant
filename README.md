vagrant
=======

1. vagrant init
  set the box = 'precise32' (add url for box if I don't already have it)
  set the ip
2. vagrant up
3. install the necessary software from the bootstrap file
4. configure nginx
  change www-data => vagrant
  turn off send files
5. sudo rm /etc/nginx/sites-enabled/default
6. sudo nano /etc/nginx/sites-enabled/drip
`# drip.fm dev server
server {
  server_name localhost;
  
  root /vagrant;
  index index.html index.php;
  client_max_body_size 200m;

  location / {
    try_files $uri $uri/ /index.php;
  }

  location ~* \.php$ {
    fastcgi_pass 127.0.0.1:9000;
    fastcgi_index index.php;
    fastcgi_split_path_info ^(.+\.php)(.*)$;
    include fastcgi_params;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;  
  }

  location ~ /\.ht {
    deny all;
  }
}`
7. sudo nano /etc/php5/fpm/php.ini
  fix the max upload sizes
8. setup mysql
 create user 'ghostly'@'%' identified by 'ghostly';
create database ghostly_dev;
grant all privileges on ghoslty_dev.* to 'miguel'@'%';
9. import your database

