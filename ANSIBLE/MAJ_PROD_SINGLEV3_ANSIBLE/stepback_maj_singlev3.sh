#!/bin/bash

ansible-playbook -i host_singlev3.yml  --user=root playbook_stepback_singlev3.yml | tee ./log/run.log | tee ./log/back.log
