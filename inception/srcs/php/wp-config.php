<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'ENV_GET_USER' );

/** Database password */
define( 'DB_PASSWORD', 'ENV_GET_PASS' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'hNGY.j [7$7^qFYG=EfHmp kZ-$D(0C)f-7ak ],,tdO=n|n Z;q5B}CP<])#Usu');
define('SECURE_AUTH_KEY',  '-6E$ PiG.bcOqg9de=L7_-v$|kL*q4=&f$)9l1po|03|n5}N: G$Lp``Xw9K_%+n');
define('LOGGED_IN_KEY',    'wlA&EbVB6h,n]bUo,2`?_tCM+TJ]-cTc67 f{0z%gW{D+y7B@u+K--g-hS;Ae`v-');
define('NONCE_KEY',        '=>//hY~!|_=zOFK0O6V73p=<re/N-cH-Oj<p)*5f[`flVG<Y~!r]xxkwZEC4<0+n');
define('AUTH_SALT',        'j%r MuVc/++[0/4<f<Z*;C.RU/}y)f|;Qz+:VnOGa7I{XAcZ[o+T?nZ&I|^nM&%n');
define('SECURE_AUTH_SALT', ')mz%IY4WW4>XY{v&3R^06SgFVe,g Y_}]b?w3w{L-D)/p#J}tAHSWGJ+P|CKs}xQ');
define('LOGGED_IN_SALT',   'RK8Pj/bWnDR$0aXL-@i|HyteA</Iv <C_PCeNVENM0wc_t-M(Coi[-DY+Jf;N|S^');
define('NONCE_SALT',       'H-(VWlbL#!9SP,F/z(>t=o@3#c1yRGBB32J 1ki1qZ=n*>)4C6nxem+Zp655v%u5');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
