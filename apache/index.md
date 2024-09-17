# Apache

## URL rewriting

Example de `.htaccess`:

```sh
<IfModule mod_rewrite.c>
RewriteEngine On
RewriteCond %{SCRIPT_FILENAME} !-d
RewriteCond %{SCRIPT_FILENAME} !-f
 
RewriteRule ^api/trace/([0-9]+)/?$ trace.php?id=$1 [NC,L]
</If>
```
