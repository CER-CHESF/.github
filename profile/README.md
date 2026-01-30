# CHESF - P6

Sistema inteligente com aerogerador integrado às fontes deenergia eólica, solar e storage como plataforma de desenvolvimento visando melhorias contínuas no processo de geração de energia elétrica

## Componentes

<table border="1" cellspacing="0" cellpadding="5">
  <thead>
    <tr>
      <th >#</th>
      <th >Componente</th>
      <th colspan="2">Repositório</th>
      <th >Status</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="5">MODELOS</td>
    </tr>
    <tr>
      <td>00</td><td>QA - Global</td><td><a href="https://github.com/CER-CHESF/p6_qa_global_core">CORE ✅</a></td><td><a href="https://github.com/CER-CHESF/p6-qa-global-wrapper">WRAPPER 🧑‍💻</a></td><td> ---</td>
    </tr>
    <tr>
      <td>00</td><td>QA - Local - Eólica</td><td><a href="https://github.com/CER-CHESF/p6_qa_local_eolica_core">CORE ✅</a></td><td><a href="https://github.com/CER-CHESF/p6_qa_local_eolica_wrapper">WRAPPER 🧑‍💻 </a></td><td> ---</td>
    </tr>
    <tr>
      <td>00</td><td>QA - Local - Solar</td><td><a href="https://github.com/CER-CHESF/p6_qa_local_solar_core">CORE ✅</a></td><td><a href="https://github.com/CER-CHESF/p6_qa_local_solar_wrapper">WRAPPER ✅</a></td><td> v0.1.1 </td>
    </tr>
    <tr>
      <td>00</td><td>Satélite - HD</td><td><a href="https://github.com/CER-CHESF/p6_sat_h_core">CORE 🧑‍💻</a></td><td><a href="https://github.com/CER-CHESF/p6_sat_h_wrapper">WRAPPER ⏳</a></td><td> ---</td>
    </tr>
    <tr>
      <td>00</td><td>DS - HD</td><td><a href="https://github.com/CER-CHESF/p6_ds_hd_core">CORE ✅</a></td><td><a href="https://github.com/CER-CHESF/p6-ds-hd-wrapper">WRAPPER 🧑‍💻</a></td><td> ---</td>
    </tr>
    <tr>
      <td>00</td><td>PCM - DIR - HD</td><td colspan="3"> Mesma capsula de DS - HD </td>
    </tr>
    <tr>
      <td>00</td><td>PCM - IND - HD</td><td><a href="https://github.com/CER-CHESF/p6_pcm_ind_hd_core">CORE ✅</a></td><td><a href="https://github.com/CER-CHESF/p6-pcm-ind-hd-wrapper">WRAPPER ✅</a></td><td> v0.1.0 </td>
    </tr>
    <tr>
      <td>00</td><td>PCM - IND - FIS - HD</td><td><a href="https://github.com/CER-CHESF/p6_pcm_ind_fis_hd_core">CORE ✅</a></td><td><a href="https://github.com/CER-CHESF/p6_pcm_ind_fis_hd_wrapper">WRAPPER 🧑‍💻</a></td><td> ---</td>
    </tr>
    <tr>
      <td>00</td><td>TS - HD</td><td><a href="https://github.com/CER-CHESF/p6_ts_hd_core">CORE ✅</a></td><td><a href="https://github.com/CER-CHESF/p6_ts_hd_wrapper">WRAPPER ✅</a></td><td> v0.3.0 </td>
    </tr>
    <tr>
      <td>00</td><td>Combinação - ALL - HD</td><td><a href="https://github.com/CER-CHESF/p6_comb_all_core">CORE 🧑‍💻</a></td><td><a href="https://github.com/CER-CHESF/p6-comb-all-wrapper">WRAPPER ⏳</a></td><td> ---</td>
    </tr>
    <tr>
      <td colspan="5">LXC / VM</td>
    </tr>
    <tr>
      <td>00</td><td>WRF - Eólica</td><td colspan="2"><a href="#">CONTAINER ✅</a></td><td> DONE </td>
    </tr>
    <tr>
      <td>00</td><td>WRF - Solar</td><td colspan="2"><a href="#">CONTAINER ✅</a></td><td> DONE </td>
    </tr>
    <tr>
      <td colspan="5">CONSUMES API</td>
    </tr>
    <tr>
      <td>00</td><td>Consumer - EPM</td><td colspan="2"><a href="https://github.com/CER-CHESF/p6_data_connector">CONSUMER ✅</a></td><td> v0.1.1 </td>
    </tr>
    <tr>
      <td>00</td><td>Consumer - GFS</td><td colspan="2"><a href="https://github.com/CER-CHESF/p6_gfs_consumer">CONSUMER</a></td><td> ---</td>
    </tr>
    <tr>
      <td>00</td><td>Consumer - GOES 19</td><td colspan="2"><a href="https://github.com/CER-CHESF/p6_goes19_consumer">CONSUMER ✅</a></td><td> v0.2.0 </td>
    </tr>
  </tbody>
</table>



## Montando ambiente para a suite

### Repositório de dados

Faça o download dos scripts [create_data_room.sh](create_data_room.sh) e do [create_docker_volumes.sh](create_docker_volumes.sh) no diretório designado para repositório de dados da ferramenta.

- Execute:

```bash
./create_data_room.sh
./create_docker_volumes.sh
```

### Montar os volumes no compose.yaml

- Listar os volumes disponíveis:

```bash
docker volume ls | grep data_p6_
```

- No compose.yaml do seu modelo:
  Use para os modelos os volumes que já foram criados previamente como externos.

```yaml
# ...
# Na sessão de mapeamento de volumes externo/interno do container
    volumes:
      - data_p6_ds_hd_output_logs:/wrapper_workdir/output/logs
      - data_p6_qa_local_eolico_output_operation:/wrapper_workdir/input/p6_qa_local_eolico
# ...
# Na sessão de definição de volumes
volumes:
  data_p6_ds_hd_output_logs:
    external: true
  data_p6_qa_local_eolico_output_operation:
    external: true
# ...

```
