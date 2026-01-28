#!/bin/bash

set -e


# Array com pares: "nome-do-volume:/caminho/no/host"
# Adicione quantos quiser aqui, um por linha no formato "nome:/caminho"
volumes=(
    "data_p6_input_c3s_eccc:data/input/c3s/eccc"
    "data_p6_input_c3s_ecmwf:data/input/c3s/ecmwf"
    "data_p6_input_cmip6:data/input/cmip6"
    "data_p6_input_gfs:data/input/gfs"
    "data_p6_input_obs_scada_eolico:data/input/obs/scada_eolico"
    "data_p6_input_obs_scada_solar:data/input/obs/scada_solar"
    "data_p6_input_obs_tma:data/input/obs/tma"
    "data_p6_input_obs_esol:data/input/obs/esol"
    "data_p6_input_wrf_ctrl:data/input/wrf_ctrl"
    "data_p6_input_wrf_solar:data/input/wrf_solar"
    "data_p6_input_satellite:data/input/satellite/"

    "data_p6_data_connector_output_logs:data/output/p6_data_connector/logs"
    "data_p6_data_connector_output_operation:data/output/p6_data_connector/operation"
    "data_p6_data_connector_output_train:data/output/p6_data_connector/train"
    "data_p6_data_connector_params_config:data/params/p6_data_connector/config"
    "data_p6_data_connector_params_model_trained_state:data/params/p6_data_connector/model_trained_state"

    "data_p6_qa_global_output_logs:data/output/p6_qa_global/logs"
    "data_p6_qa_global_output_operation:data/output/p6_qa_global/operation"
    "data_p6_qa_global_output_train:data/output/p6_qa_global/train"
    "data_p6_qa_global_params_config:data/params/p6_qa_global/config"
    "data_p6_qa_global_params_model_trained_state:data/params/p6_qa_global/model_trained_state"

    "data_p6_qa_local_eolico_output_logs:data/output/p6_qa_local_eolico/logs"
    "data_p6_qa_local_eolico_output_operation:data/output/p6_qa_local_eolico/operation"
    "data_p6_qa_local_eolico_output_train:data/output/p6_qa_local_eolico/train"
    "data_p6_qa_local_eolico_params_config:data/params/p6_qa_local_eolico/config"
    "data_p6_qa_local_eolico_params_model_trained_state:data/params/p6_qa_local_eolico/model_trained_state"

    "data_p6_qa_local_solar_output_logs:data/output/p6_qa_local_solar/logs"
    "data_p6_qa_local_solar_output_operation:data/output/p6_qa_local_solar/operation"
    "data_p6_qa_local_solar_output_train:data/output/p6_qa_local_solar/train"
    "data_p6_qa_local_solar_params_config:data/params/p6_qa_local_solar/config"
    "data_p6_qa_local_solar_params_model_trained_state:data/params/p6_qa_local_solar/model_trained_state"

    "data_p6_sat_h_output_logs:data/output/p6_sat_h/logs"
    "data_p6_sat_h_output_operation:data/output/p6_sat_h/operation"
    "data_p6_sat_h_output_train:data/output/p6_sat_h/train"
    "data_p6_sat_h_params_config:data/params/p6_sat_h/config"
    "data_p6_sat_h_params_model_trained_state:data/params/p6_sat_h/model_trained_state"

    "data_p6_ds_hd_output_logs:data/output/p6_ds_hd/logs"
    "data_p6_ds_hd_output_operation:data/output/p6_ds_hd/operation"
    "data_p6_ds_hd_output_train:data/output/p6_ds_hd/train"
    "data_p6_ds_hd_params_config:data/params/p6_ds_hd/config"
    "data_p6_ds_hd_params_model_trained_state:data/params/p6_ds_hd/model_trained_state"

    "data_p6_pcm_dir_hd_output_logs:data/output/p6_pcm_dir_hd/logs"
    "data_p6_pcm_dir_hd_output_operation:data/output/p6_pcm_dir_hd/operation"
    "data_p6_pcm_dir_hd_output_train:data/output/p6_pcm_dir_hd/train"
    "data_p6_pcm_dir_hd_params_config:data/params/p6_pcm_dir_hd/config"
    "data_p6_pcm_dir_hd_params_model_trained_state:data/params/p6_pcm_dir_hd/model_trained_state"

    "data_p6_pcm_ind_hd_output_logs:data/output/p6_pcm_ind_hd/logs"
    "data_p6_pcm_ind_hd_output_operation:data/output/p6_pcm_ind_hd/operation"
    "data_p6_pcm_ind_hd_output_train:data/output/p6_pcm_ind_hd/train"
    "data_p6_pcm_ind_hd_params_config:data/params/p6_pcm_ind_hd/config"
    "data_p6_pcm_ind_hd_params_model_trained_state:data/params/p6_pcm_ind_hd/model_trained_state"

    "data_p6_pcm_ind_fis_hd_output_logs:data/output/p6_pcm_ind_fis_hd/logs"
    "data_p6_pcm_ind_fis_hd_output_operation:data/output/p6_pcm_ind_fis_hd/operation"
    "data_p6_pcm_ind_fis_hd_output_train:data/output/p6_pcm_ind_fis_hd/train"
    "data_p6_pcm_ind_fis_hd_params_config:data/params/p6_pcm_ind_fis_hd/config"
    "data_p6_pcm_ind_fis_hd_params_model_trained_state:data/params/p6_pcm_ind_fis_hd/model_trained_state"

    "data_p6_ts_hd_output_logs:data/output/p6_ts_hd/logs"
    "data_p6_ts_hd_output_operation:data/output/p6_ts_hd/operation"
    "data_p6_ts_hd_output_train:data/output/p6_ts_hd/train"
    "data_p6_ts_hd_params_config:data/params/p6_ts_hd/config"
    "data_p6_ts_hd_params_model_trained_state:data/params/p6_ts_hd/model_trained_state"

    "data_p6_comb_all_output_logs:data/output/p6_comb_all/logs"
    "data_p6_comb_all_output_operation:data/output/p6_comb_all/operation"
    "data_p6_comb_all_output_train:data/output/p6_comb_all/train"
    "data_p6_comb_all_params_config:data/params/p6_comb_all/config"
    "data_p6_comb_all_params_model_trained_state:data/params/p6_comb_all/model_trained_state"

)

# Loop para criar cada volume
for volume in "${volumes[@]}"; do
    # Extrai nome e caminho do par (separado por :)
    nome=$(echo "$volume" | cut -d: -f1)
    caminho="$(pwd)/$(echo "$volume" | cut -d: -f2)"

    echo "Criando volume: $nome (bind para $caminho)..."

    # Comando Docker para criar o volume bind mount
    docker volume create \
        --opt type=none \
        --opt device="$caminho" \
        --opt o=bind \
        "$nome"

    if [ $? -eq 0 ]; then
        echo "✓ Volume $nome criado com sucesso!"
    else
        echo "✗ Erro ao criar $nome. Verifique se o caminho $caminho existe e tem permissões adequadas."
    fi
    echo "---"
done

echo "Criação de volumes concluída!"
