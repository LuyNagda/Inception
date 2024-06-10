# Install WP
if [ ! -f "${WP_PATH}/wp-config.php" ]; then

  # Download Wordpress
  wp core download --path=$WP_PATH --allow-root

  # Config wordpress database
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
              --allow-root \
              --path=$WP_PATH

fi

# Run PHP
mkdir -p /run/php
php-fpm7.4 -F