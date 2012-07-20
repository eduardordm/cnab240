# CNAB 240

[![Build Status](https://secure.travis-ci.org/eduardordm/cnab240.png)](http://travis-ci.org/eduardordm/cnab240)

Esta é uma implementação do Layout Padrão Febraban 240 posições, e algumas variações. Provavelmente vou adicionar o CNAB 400 na mesma gem. Talvez adicione também um puxadinho para voce poder usar o ActiveRecord.


Os padrões da febraban são fruto de incompêtencia que ultrapassa os limites do patético. Espero que essa implementação lhe poupe algumas horas de sofrimento. 


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

Por enquanto sem muita documentação (veja os testes).

Em algum lugar voce pode criar um arquivo de inicialização (não é obrigatório):

A única configuração suportada até o momento é a de valores-padrão para campos:

```ruby
	Cnab240.setup do |config|
		# configuracoes aqui
		config.defaults[:empresa_tipo] = "1"
	end
```

Voce pode criar arquivos, e adicionar lotes. A versão é automaticamente a 8.6, se preferir voce pode escolher outra versão. Utilize o operador << do arquivo para adicionar lotes.

```ruby
	arquivo = Arquivo::Arquivo.new
	lote = Lote.new(:operacao => :pagamento, :tipo => :remessa)
	# preencha os zilhoes de campos
	arquivo << lote
	arquivo.save_to_file("arquivo.test")
```
Quando um lote é criado, os segmento obrigatórios e métodos de acesso serão criados automagicamente. Para adicionar mais segmentos utilize o operador << do lote.

```ruby
	arquivo = Arquivo::Arquivo.new('V86')
	lote = Lote.new(:operacao => :pagamento, :tipo => :remessa)
	# preencha os zilhoes de campos
	lote.segmento_a.favorecido_banco = '1'
	arquivo << lote
	arquivo.save_to_file("arquivo.test")
```

Ler do arquivo:

```ruby
	arquivos = Arquivo::Arquivo.load_from_file("spec/tmp/arquivo.test") # array de objetos Arquivo
	puts arquivos[0].header
```
		
## Considerações

- Tudo string. O arquivo é de strings, a implementação também.

## Contribuindo

Adicione testes, abra o pull request. Sem bikeshedding, wizardry ou craftismos pro meu lado!!! O código aqui deve ser de simples entendimento. 

Meta code coverage: 100% para layout e marshalling. O resto, só se for muito importante.

