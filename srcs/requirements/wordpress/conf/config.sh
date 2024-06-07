cd /var/www/wordpress
wp core config	--dbhost=$DB_HOST \
				--dbname=$DB_NAME \
				--dbuser=$DB_USER \
				--dbpass=$DB_PASSWORD \
				--allow-root

wp core install --title=$WP_TITLE \
				--admin_user=$WP_ADMIN_USR \
				--admin_password=$WP_ADMIN_PWD \
				--admin_email=$WP_ADMIN_EMAIL \
				--url=$WP_URL \
				--allow-root

wp user create $WP_USER $WP_MAIL --role=author --user_pass=$WP_PWD --allow-root
cd -

php-fpm7.3 -F