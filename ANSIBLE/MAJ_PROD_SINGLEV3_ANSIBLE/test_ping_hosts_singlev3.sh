#!/bin/bash

ansible all -i host_singlev3.yml --user=root -m "ping" 
