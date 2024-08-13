#!/bin/bash
somafm random &
echo $! >/tmp/somafm.pid
