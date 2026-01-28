#!/bin/bash

set -e


mkdir -pv ./data/input/{obs,gfs,wrf_ctrl,wrf_solar,c3s,satellite,cmip6}
mkdir -pv ./data/input/obs/{scada_eolico,tma,scada_solar,esol}
mkdir -pv ./data/input/c3s/{ecmwf,eccc}

mkdir -pv ./data/output/{p6_data_connector,p6_qa_global,p6_qa_local_eolico,p6_qa_local_solar,p6_sat_h,p6_ds_hd,p6_pcm_dir_hd,p6_pcm_ind_hd,p6_pcm_ind_fis_hd,p6_ts_hd,p6_comb_all}

mkdir -pv ./data/params/{p6_data_connector,p6_qa_global,p6_qa_local_eolico,p6_qa_local_solar,p6_sat_h,p6_ds_hd,p6_pcm_dir_hd,p6_pcm_ind_hd,p6_pcm_ind_fis_hd,p6_ts_hd,p6_comb_all}

for d in ./data/output/*; do
    mkdir -pv "$d"/{train,operation,logs}
done

for d in ./data/params/*; do
    mkdir -pv "$d"/{config,model_trained_state}
done
