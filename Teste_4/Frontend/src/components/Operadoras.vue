<template>
  <div>
    <div id="general_search">
      <div id="title">
        <p> Operadoras de Plano de Saúde Ativas </p>
        <p> Relatório Cadop </p>
      </div>

      <div>
        <input id="general_search_input" type="text" v-model="input" placeholder="Buscar operadora" minlength="1">
        <button id="general_search_button" v-on:click="procurar(this.input)"> Pesquisar </button>
      </div>      
    </div>
    <table>
      <thead>
        <tr>
          <th> Registro ANS </th>
          <th> CNPJ </th>
          <th> Razão Social </th>
          <th> Nome Fantasia </th>
          <th> Modalidade </th>
          <th> Logradouro </th>
          <th> Número </th>
          <th> Complemento </th>
          <th> Bairro </th>
          <th> Cidade </th>
          <th> UF </th>
          <th> CEP </th>
          <th> Região de Comercialização </th>
          <th> DDD </th>
          <th> Telefone </th>
          <th> Fax </th>
          <th> Email </th>
          <th> Representante </th>
          <th> Cargo Representante </th>
          <th> Data de Registro ANS </th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="dado in operadoras">
          <td>{{ dado.Registro_ANS }}</td>
          <td>{{ dado.CNPJ }}</td>
          <td>{{ dado.Razao_Social }}</td>
          <td>{{ dado.Nome_Fantasia }}</td>
          <td>{{ dado.Modalidade }}</td>
          <td>{{ dado.Logradouro }}</td>
          <td>{{ dado.Numero }}</td>
          <td>{{ dado.Complemento }}</td>
          <td>{{ dado.Bairro }}</td>
          <td>{{ dado.Cidade }}</td>
          <td>{{ dado.UF }}</td>
          <td>{{ dado.CEP }}</td>
          <td>{{ dado.Regiao_de_Comercializacao }}</td>
          <td>{{ dado.DDD }}</td>
          <td>{{ dado.Telefone }}</td>
          <td>{{ dado.Fax }}</td>
          <td>{{ dado.Endereco_eletronico }}</td>
          <td>{{ dado.Representante }}</td>
          <td>{{ dado.Cargo_Representante }}</td>
          <td>{{ dado.Data_Registro_ANS }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import Buscar from '../services/api.js'

export default {
  data() {
    return {
      operadoras: [
        {
          Bairro: "",
          CEP: "",
          CNPJ: "",
          Cargo_Representante: "",
          Cidade: "",
          Complemento: "",
          DDD: "",
          Data_Registro_ANS: "",
          Endereco_eletronico: "",
          Fax: "",
          Logradouro: "",
          Modalidade: "",
          Nome_Fantasia: "",
          Numero: "",
          Razao_Social: "",
          Regiao_de_Comercializacao: "",
          Registro_ANS: "",
          Representante: "",
          Telefone: "",
          UF: ""
        }
      ],
      input: null
    }
  },

  methods: {
    procurar(value) {
        Buscar.listar(value).then(response => {
          if (response.status == 200) {
            this.operadoras = response.data;
          }
        })
      }
  },

  mounted() {
    this.procurar("a");
  }
}
</script>

<style scoped>
#title {
  background-color: #00cdb5;
  height: 100%;
}

#title > p {
  text-align: center;
  font-family: Arial, sans-serif;
  font-weight: bold;
  color: black;
}

#general_search {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  width: 100%;
  padding: 10px;
  gap: 2px;
  background-color: #00cdb5;
  font-family: Arial, sans-serif;
  font-weight: bold;
  color: black;
}

#general_search > label {
  font-family: Arial, sans-serif;
  font-weight: bold;
  color: black;
}

#general_search_input {
  padding: 5px;
  width: 400px;
}

#general_search_button {
  padding: 5px;
}
</style>
