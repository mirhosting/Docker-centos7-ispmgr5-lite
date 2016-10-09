#!/bin/bash

service exim restart
cd /usr/local/mgr5 && ./bin/core ispmgr
/bin/bash
