# CNAB PAN

Uma extensão do CNAB240, com algumas correções para o Itaú.
=======================================================


Esta é uma implementação do Layout Padrão Febraban 240 posições, e algumas variações. Provavelmente vou adicionar o CNAB 400 na mesma gem. Talvez adicione também um puxadinho para voce poder usar o ActiveRecord.


Os padrões da febraban são fruto de incompêtencia que ultrapassa os limites do patético. Espero que essa implementação lhe poupe algumas horas de sofrimento. 

Cada banco tem uma visão particular sobre o padrão, os bancos:

- Subdividem os campos em outros menores;
- Trocam o nome e utilidade de campos;

Tudo isso para que eu sumisse do Rio de Janeiro e não fizesse a descoberta de ser King Size.

Dê um git clone no master do repositório para que voce tenha acesso aos modelos (sem RDoc ainda).


Adicionar mais implementações é simples. Leia os testes. Aos poucos vou adicionando alguma documentação.


## Variações suportadas:

Somente pagamentos. Veja pasta docs/ 

- Layout Padrão FEBRABAN 240 posições V8.6 
- Layout FEBRABAN 240 posições V80 (Itaú - SISPAG)


## Instalação

Adicione ao Gemfile:

    gem 'cnab240'

execute:

    $ bundle

Ou adicione no seu chiqueiro:

    $ gem install cnab240

## Como usar

Por enquanto sem muita documentação (veja os testes). Você vai precisar ler os documentos da pasta docs para se situar, são muitos campos com nomes bem parecidos. Utilize a documentação dos bancos/febraban como referência.


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
Para adicionar segmentos utilize o operador << do lote.

```ruby
	arquivo = Arquivo::Arquivo.new('V86')
	lote = Lote.new(:operacao => :pagamento, :tipo => :remessa)
	lote << :a
	# preencha os zilhoes de campos
	lote.segmentos[0].favorecido_banco = '1'
	arquivo << lote
	arquivo.save_to_file("arquivo.test")
```

Ler do arquivo:

```ruby
	arquivos = Arquivo::Arquivo.load_from_file("spec/tmp/arquivo.test") # array de objetos Arquivo
	puts arquivos[0].header
```

### Usando Helpers

Voce pode usar os helpers que vao preencher os campos automaticamente, se possivel:

```ruby
	pagamento = PagamentoItau.new({ 
		:empresa_tipo => '2',
		:empresa_numero => '07946982000133',
		:empresa_nome => 'LOJA DO BRASIL LTDA',
		:empresa_agencia_codigo => '663',
		:empresa_conta_numero => '01540',
		:empresa_agencia_conta_dv => '0',
		:arquivo_sequencia => '1',

		:endereco_logradouro => 'RUA GETULIO VARGAS',
		:endereco_numero => '3646',
		:endereco_cidade => 'PORTO VELHO',
		:endereco_cep => '76000000',
		:endereco_estado => 'RO',
		:servico_tipo => '98', # pagamentos - diversos
		:servico_forma => '41', # doc, ted, etc
	})

	pagamento << { 
		:favorecido_banco => '001',
		:favorecido_agencia => '2280',
		:favorecido_conta => '335959',
		:favorecido_agencia_conta_dv => '9',
		:credito_seu_numero => '1',
		:credito_data_pagamento => '03082012',
		:credito_valor_pagamento => '500000',
		:numero_inscricao => '19375208168',
		:favorecido_nome => 'EDUARDO MOURAO'
	}

	pagamento.string
```
		
## Considerações

- Tudo string. O arquivo é de strings, a implementação também;
- Padding é automático.

## Contribuindo

Adicione testes, abra o pull request. Sem bikeshedding, wizardry ou craftismos pro meu lado!!! O código aqui deve ser de simples entendimento. 

