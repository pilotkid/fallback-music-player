#!/bin/bash
kill $(cat /tmp/somafm.pid)
amixer sset 'Master' 100%
