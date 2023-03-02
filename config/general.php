<?php
/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here. You can see a
 * list of the available settings in vendor/craftcms/cms/src/config/GeneralConfig.php.
 *
 * @see \craft\config\GeneralConfig
 */

use craft\config\GeneralConfig;
use craft\helpers\App;

// Rewrite the PRIMARY_SITE_URL env var if we're running in Codespaces
if (App::env('CODESPACES')) {
    // putenv() only affects the OS's environment, so set it directly
    $_ENV['PRIMARY_SITE_URL'] = $_SERVER['PRIMARY_SITE_URL'] = sprintf(
        "https://%s-%s.%s/",
        App::env('CODESPACE_NAME'),
        App::env('DEV_SERVER_PORT'),
        App::env('GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN')
    );
}

return GeneralConfig::create()
    // Explicitly set the @web alias from the PRIMARY_SITE_URL env var
    ->aliases([
        '@web' => App::env('PRIMARY_SITE_URL'),
    ])
    // Use a unique CSRF token name, to avoid issues with CSRF validation with multiple instances of
    // Craft running on the same host (localhost)
    ->csrfTokenName(App::env('CRAFT_APP_ID'))
    // Don't run the queue via web request, our queue container handles it
    ->runQueueAutomatically(false)
    // Set the default week start day for date pickers (0 = Sunday, 1 = Monday, etc.)
    ->defaultWeekStartDay(1)
    // Prevent generated URLs from including "index.php"
    ->omitScriptNameInUrls()
    // Enable Dev Mode (see https://craftcms.com/guides/what-dev-mode-does)
    ->devMode(App::env('DEV_MODE') ?? false)
    // Allow administrative changes
    ->allowAdminChanges(App::env('ALLOW_ADMIN_CHANGES') ?? false)
    // Disallow robots
    ->disallowRobots(App::env('DISALLOW_ROBOTS') ?? false)
;
