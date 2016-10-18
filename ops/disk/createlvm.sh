#!/bin/bash

pvcreate /dev/xvdb5

vgs

vgextend VolGroup /dev/xvdb5

lvs

lvextend -L 135.6G /dev/VolGroup/lv_root

resize2fs /dev/VolGroup/lv_root

