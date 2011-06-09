#; Enable the PHP scripting language engine under Apache.
default[:php5][:engine]                                     = "On"

=begin
; Allow the <? tag.  Otherwise, only <?php and <script> tags are recognized.
; NOTE: Using short tags should be avoided when developing applications or
; libraries that are meant for redistribution, or deployment on PHP
; servers which are not under your control, because short tags may not
; be supported on the target server. For portable, redistributable code,
; be sure not to use short tags.
=end
default[:php5][:short_open_tag]                            = "On"

#; Allow ASP-style <% %> tags.
default[:php5][:asp_tags]                                   = "Off"

#*; The number of significant digits displayed in floating point numbers.
default[:php5][:precision]                                  = "12"

=begin
; Output buffering allows you to send header lines (including cookies) even
; after you send body content, at the price of slowing PHP's output layer a
; bit.  You can enable output buffering during runtime by calling the output
; buffering functions.  You can also enable output buffering for all files by
; setting this directive to On.  If you wish to limit the size of the buffer
; to a certain size - you can use a maximum number of bytes instead of 'On', as
; a value for this directive (e.g., output_buffering=4096).
=end

default[:php5][:output_buffering]                           = "Off"

=begin
; When floats & doubles are serialized store serialize_precision significant
; digits after the floating point. The default value ensures that when floats
; are decoded with unserialize, the data will remain the same.
=end
default[:php5][:serialize_precision]                        = "100"

#; Maximum amount of memory a script may consume (16MB)
default[:php5][:resource_limits][:memory_limit]             = "196M"

#; Maximum execution time of each script, in seconds
default[:php5][:resource_limits][:max_execution_time]       = "30"
default[:php5][:error_handling][:error_reporting]           = "ALL"

=begin
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Error handling and logging ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; error_reporting is a bit-field.  Or each number up to get desired error
; reporting level
; E_ALL             - All errors and warnings (doesn't include E_STRICT)
; E_ERROR           - fatal run-time errors
; E_RECOVERABLE_ERROR  - almost fatal run-time errors
; E_WARNING         - run-time warnings (non-fatal errors)
; E_PARSE           - compile-time parse errors
; E_NOTICE          - run-time notices (these are warnings which often result
;                     from a bug in your code, but it's possible that it was
;                     intentional (e.g., using an uninitialized variable and
;                     relying on the fact it's automatically initialized to an
;                     empty string)
; E_STRICT          - run-time notices, enable to have PHP suggest changes
;                     to your code which will ensure the best interoperability
;                     and forward compatibility of your code
; E_CORE_ERROR      - fatal errors that occur during PHP's initial startup
; E_CORE_WARNING    - warnings (non-fatal errors) that occur during PHP's
;                     initial startup
; E_COMPILE_ERROR   - fatal compile-time errors
; E_COMPILE_WARNING - compile-time warnings (non-fatal errors)
; E_USER_ERROR      - user-generated error message
; E_USER_WARNING    - user-generated warning message
; E_USER_NOTICE     - user-generated notice message
;
; Examples:
;
;   - Show all errors, except for notices and coding standards warnings
;
;error_reporting = E_ALL & ~E_NOTICE
;
;   - Show all errors, except for notices
;
;error_reporting = E_ALL & ~E_NOTICE | E_STRICT
;
;   - Show only errors
;
;error_reporting = E_COMPILE_ERROR|E_RECOVERABLE_ERROR|E_ERROR|E_CORE_ERROR
;
;   - Show all errors except for notices and coding standards warnings
;
=end
default[:php5][:error_handling][:display_errors]            = "On"

=begin
; Log errors into a log file (server-specific log, stderr, or error_log (below))
; As stated above, you're strongly advised to use error logging in place of
; error displaying on production web sites.
=end

default[:php5][:error_handling][:log_errors]                = "On"

#; Maximum size of POST data that PHP will accept.
default[:php5][:data_handling][:post_max_size] = "1024M"

#; Whether to allow HTTP file uploads.
default[:php5][:file_uploads][:file_uploads] = "On"

#; Maximum allowed size for uploaded files.
default[:php5][:file_uploads][:upload_max_filesize]  = "1024M"

