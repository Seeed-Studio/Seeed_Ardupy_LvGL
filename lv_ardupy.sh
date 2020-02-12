#!/bin/bash
#This script automatically generates littlevgl files with ardupy binding 
#according to the configuration
#LittlevGL
CURRENT_DIR=$(cd $(dirname $0); pwd)
LVGL_ARDUPY_DIR=$CURRENT_DIR/lv_ardupy
LVGL_DIR=$CURRENT_DIR/lvgl
LVGL_GENERIC_DRV_DIR=$CURRENT_DIR/driver/generic
LVGL_PP=$LVGL_ARDUPY_DIR/lv.pp.c
LVGL_MPY=$LVGL_ARDUPY_DIR/lv_mpy.c
LVGL_MPY_METADATA=$LVGL_ARDUPY_DIR/lv_mpy.json
echo "LVGL-GEN $LVGL_PP"
mkdir -p $LVGL_ARDUPY_DIR
gcc -E  -I$CURRENT_DIR/pycparser/utils/fake_libc_include -I$CURRENT_DIR  $LVGL_DIR/lvgl.h > $LVGL_PP
python3 $CURRENT_DIR/gen/gen_mpy.py -M lvgl -MP lv -MD $LVGL_MPY_METADATA -E $LVGL_PP $LVGL_DIR/lvgl.h > $LVGL_MPY