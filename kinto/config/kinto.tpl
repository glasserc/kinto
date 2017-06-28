# Created at {config_file_timestamp}
# Using Kinto version {kinto_version}


[server:main]
use = egg:waitress#main
host = {host}
port = %(http_port)s


[app:main]
use = egg:kinto

# Production settings
#
# https://kinto.readthedocs.io/en/latest/configuration/production.html
#
# kinto.statsd_backend = kinto.core.statsd
# kinto.statsd_url = udp://localhost:8125
# kinto.statsd_prefix = kinto-prod

# kinto.http_scheme = https
# kinto.http_host = kinto.services.mozilla.com

# kinto.backoff = 10
# kinto.retry_after_seconds = 30
# kinto.eos =

# Full options list for .ini file
# https://kinto.readthedocs.io/en/latest/configuration/settings.html

# Feature settings
# https://kinto.readthedocs.io/en/latest/configuration/settings.html#feature-settings
#
# kinto.readonly = False
# kinto.batch_max_requests = 25
# kinto.paginate_by=None
# kinto.<object-type>_id_generator=UUID4 <bucket, collection, group, record>
# Experimental JSON-schema on collection
# kinto.experimental_collection_schema_validation = False
#
# https://kinto.readthedocs.io/en/latest/configuration/settings.html#activating-the-permissions-endpoint
# kinto.experimental_permissions_endpoint = False
#
# kinto.trailing_slash_redirect_enabled = True
# kinto.heartbeat_timeout_seconds = 10

# Backends
# https://kinto.readthedocs.io/en/latest/configuration/settings.html#storage
#
kinto.storage_backend = {storage_backend}
kinto.storage_url = {storage_url}
# kinto.storage_max_fetch_size = 10000
# kinto.storage_pool_size = 25
# kinto.storage_max_overflow = 5
# kinto.storage_pool_recycle = -1
# kinto.storage_pool_timeout = 30
# kinto.storage_max_backlog = -1

# Cache
# https://kinto.readthedocs.io/en/latest/configuration/settings.html#cache
#
kinto.cache_backend = {cache_backend}
kinto.cache_url = {cache_url}
# kinto.cache_prefix = ''
# kinto.cache_max_size_bytes = 524288
# kinto.cache_pool_size = 25
# kinto.cache_max_overflow = 5
# kinto.cache_pool_recycle = -1
# kinto.cache_pool_timeout = 30
# kinto.cache_max_backlog = -1

# Permissions.
# https://kinto.readthedocs.io/en/latest/configuration/settings.html#permissions
#
kinto.permission_backend = {permission_backend}
kinto.permission_url = {permission_url}
# kinto.permission_pool_size = 25
# kinto.permission_max_overflow = 5
# kinto.permission_pool_recycle = 1
# kinto.permission_pool_timeout = 30
# kinto.permission_max_backlog - 1
# https://kinto.readthedocs.io/en/latest/configuration/settings.html#bypass-permissions-with-configuration
# kinto.bucket_create_principals = system.Authenticated

# Scheme, host, and port
# https://kinto.readthedocs.io/en/latest/configuration/settings.html#scheme-host-and-port
#
# kinto.http_host = None
# kinto.http_scheme = None

# Logging and Monitoring
#
# https://kinto.readthedocs.io/en/latest/configuration/settings.html#logging-and-monitoring
# kinto.statsd_backend = kinto.core.statsd
# kinto.statsd_prefix = kinto
# kinto.statsd_url = None
# kinto.newrelic_config = None
# kinto.newrelic_env = dev

# Logging configuration

[loggers]
keys = root, kinto

[handlers]
keys = console

[formatters]
keys = color

[logger_root]
level = INFO
handlers = console

[logger_kinto]
level = DEBUG
handlers = console
qualname = kinto

[handler_console]
class = StreamHandler
args = (sys.stderr,)
level = NOTSET
formatter = color

[formatter_color]
class = logging_color_formatter.ColorFormatter

# Authentication
# https://kinto.readthedocs.io/en/latest/configuration/settings.html#authentication
#
kinto.userid_hmac_secret = {secret}
multiauth.policies = basicauth
# Any pyramid multiauth setting can be specified for custom authentication
# https://github.com/uralbash/awesome-pyramid#authentication
#
# Accounts API configuration
#
# Enable built-in plugin.
# kinto.includes = kinto.plugins.accounts
# Enable authenticated policy.
# multiauth.policies = account
# multiauth.policy.account.use = kinto.plugins.accounts.authentication.AccountsAuthenticationPolicy
# Allow anyone to create accounts.
# kinto.account_create_principals = system.Everyone
# Set user 'account:admin' as the administrator.
# kinto.account_write_principals = account:admin
# kinto.account_read_principals = account:admin
#
# Firefox Accounts configuration
# These are working FxA credentials for localhost:8888
# kinto.includes  = kinto_fxa
# fxa-oauth.client_id = 61c3f791f740c19a
# fxa-oauth.client_secret = b13739d8a905315314b09fb7b947aaeb62b47c6a4a5efb00c378fdecacd1e95e
# fxa-oauth.oauth_uri = https://oauth-stable.dev.lcip.org/v1
# fxa-oauth.requested_scope = profile kinto
# fxa-oauth.required_scope = kinto
# fxa-oauth.relier.enabled = true
# fxa-oauth.webapp.authorized_domains = *

# Plugins
# https://kinto.readthedocs.io/en/latest/configuration/settings.html#plugins
# https://github.com/uralbash/awesome-pyramid
kinto.includes = kinto.plugins.default_bucket
#                kinto.plugins.admin
#                kinto.plugins.accounts
#                kinto.plugins.history
#                kinto.plugins.quotas

# Pluggable components
# https://kinto.readthedocs.io/en/latest/configuration/settings.html#pluggable-components
#
# kinto.logging_renderer = your_log_renderer.CustomRenderer

# Notifications
# https://kinto.readthedocs.io/en/latest/configuration/settings.html#notifications
#
# Configuration example:
# kinto.event_listeners = redis
# kinto.event_listeners.redis.use = kinto_redis.listeners
# kinto.event_listeners.redis.url = redis://localhost:6379/0
# kinto.event_listeners.redis.pool_size = 5
# kinto.event_listeners.redis.listname = queue
#
# Setting up notifications via WebSocket
# https://kinto.readthedocs.io/en/latest/tutorials/notifications-websockets.html#tutorial-notifications-websockets

# Filtering
# https://kinto.readthedocs.io/en/latest/configuration/settings.html#filtering
#
# It is possible to filter events by action and/or types of object.
# By default actions create, update and delete are notified for every kinds of objects.
# kinto.event_listeners.redis.actions = create
# kinto.event_listeners.redis.resources = bucket collection

# Cross Origin Requests
# https://kinto.readthedocs.io/en/latest/configuration/settings.html#cross-origin-requests-cors
#
# kinto.cors_origins = *

# Backoff indicators/end of service
# https://kinto.readthedocs.io/en/latest/configuration/settings.html#backoff-indicators
# https://kinto.readthedocs.io/en/latest/api/1.x/backoff.html#id1
#
# kinto.backoff = None
# kinto.retry_after_seconds
# kinto.eos = None
# kinto.eos_message = None
# kinto.eos_url = None

# Project information
# https://kinto.readthedocs.io/en/latest/configuration/settings.html#project-information
#
# kinto.version_json_path = ./version.json
# kinto.error_info_link = https://github.com/kinto/kinto/issues/
# kinto.project_docs = https://kinto.readthedocs.io
# kinto.project_version = ''
# kinto.version_prefix_redirect_enabled = True

# Enabling or disabling endpoints
# https://kinto.readthedocs.io/en/latest/configuration/settings.html#enabling-or-disabling-endpoints
# Disable article collection DELETE endpoint
# Where: - endpoint_type is either collection or record; - resource_name is the name of the resource (by default, Kinto uses # the name of the class); - method is the http method (in lower case):
# Ex:
# kinto.collection_article_delete_enabled = false
# kinto.record_mushroom_patch_enabled = false
# https://kinto.readthedocs.io/en/latest/configuration/settings.html#enabling-or-disabling-endpoints

# Application profilling
# https://kinto.readthedocs.io/en/latest/configuration/settings.html#application-profiling
# kinto.profiler_enabled = true
# kinto.profiler_dir = /tmp/profiling

# Client cache headers
# https://kinto.readthedocs.io/en/latest/configuration/settings.html#client-caching
#
# Every bucket objects objects and list
# kinto.bucket_cache_expires_seconds = 3600
#
# Every collection objects and list of every buckets
# kinto.collection_cache_expires_seconds = 3600
#
# Every group objects and list of every buckets
# kinto.group_cache_expires_seconds = 3600
#
# Every records objects and list of every collections
# kinto.record_cache_expires_seconds = 3600
#
# Records in a specific bucket
# kinto.blog_record_cache_expires_seconds = 3600
#
# Records in a specific collection in a specific bucket
# kinto.blog_article_record_cache_expires_seconds = 3600


# [uwsgi]
# wsgi-file = app.wsgi
# enable-threads = true
# socket = /var/run/uwsgi/kinto.sock
# chmod-socket = 666
# processes =  3
# master = true
# module = kinto
# harakiri = 120
# uid = kinto
# gid = kinto
# virtualenv = .venv
# lazy = true
# lazy-apps = true
# single-interpreter = true
# buffer-size = 65535
# post-buffering = 65535
# plugin = python
