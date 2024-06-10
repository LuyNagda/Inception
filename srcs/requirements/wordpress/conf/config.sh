
if [ ! -f "/var/www/wordpress/wp-config.php" ]; then

	wp core download --path=$WP_PATH --allow-root

	wp config create --dbname=$DB_NAME \
				--dbuser=$DB_USER \
				--dbpass=$DB_PASSWORD \
				--dbhost=mariadb:3306 \
				--allow-root \
				--path=$WP_PATH

	# Config wordpress core
	wp core install --url="${WP_URL}" \
				--title="${WP_TITLE}" \
				--admin_user="${WP_ADMIN_USR}" \
				--admin_password="${WP_ADMIN_PWD}" \
				--admin_email="${WP_ADMIN_EMAIL}" \
				--allow-root \
				--path=$WP_PATH

	wp user create $WP_USR $WP_EMAIL \
				--user-pass=$WP_PWD \
				--allow-root \
				--path=$WP_PATH
fi

mkdir -p /run/php
php-fpm8.3 -F
