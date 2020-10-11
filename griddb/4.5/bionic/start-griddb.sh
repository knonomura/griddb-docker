#!/bin/bash

su -c "gs_startnode -w -u admin/admin; gs_joincluster -c dockerGridDB -u admin/admin; tail -f /dev/null" - gsadm
