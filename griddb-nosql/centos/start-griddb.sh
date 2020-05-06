#!/bin/bash

su -c "gs_startnode; gs_joincluster -c dockerGridDB -u admin/admin; tail -f /dev/null" - gsadm
