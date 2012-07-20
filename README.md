# CNAB 240

[![Build Status](https://secure.travis-ci.org/eduardordm/cnab240.png)](http://travis-ci.org/eduardordm/cnab240)

Esta é uma implementação do Layout Padrão Febraban 240 posições, e algumas variações. Provavelmente vou adicionar o CNAB 400 na mesma gem. Talvez adicione também um puxadinho para voce poder usar o ActiveRecord.


Os padrões da febraban são fruto de incompêtencia que ultrapassa os limites patético. Espero que essa implementação lhe poupe algumas horas de sofrimento. 


Adicionar mais implementações é simples. Leia os testes. Aos poucos vou adicionando alguma documentação.


## Variações suportadas:

Somente pagamentos. Veja pasta docs/ 

- Layout Padrão FEBRABAN 240 posições V8.6 
- Layout FEBRABAN 240 posições V4.0 (Itaú - SISDEB)


## Instalação

Adicione ao Gemfile:

    gem 'cnab240'

execute:

    $ bundle

Ou adicione no seu chiqueiro:

    $ gem install cnab240

## Como usar

Por enquanto sem documentação, veja os testes.

## Contribuindo

Adicione testes, abra o pull request. Sem bikeshedding, wizardry ou craftismos pro meu lado!!! O código aqui deve ser de simples entendimento. 

Code coverage: 100% para layout e marshalling. O resto, só se for muito importante.

