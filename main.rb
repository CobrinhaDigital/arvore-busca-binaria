class No
  attr_accessor :valor, :esquerda, :direita

  def initialize(valor)
    @valor = valor
    @esquerda = nil
    @direita = nil
  end
end

class ArvoreBuscaBinaria
  attr_accessor :raiz

  def initialize
    @raiz = nil
  end

  def inserir(valor)
    @raiz = _inserir(@raiz, valor)
  end

  def _inserir(no, valor)
    return No.new(valor) if no.nil?

    if valor < no.valor
      no.esquerda = _inserir(no.esquerda, valor)
    elsif valor > no.valor
      no.direita = _inserir(no.direita, valor)
    end

    no
  end

  def buscar_recursiva(valor)
    _buscar_recursiva(@raiz, valor)
  end

  def _buscar_recursiva(no, valor)
    return no if no.nil? || no.valor == valor

    if valor < no.valor
      _buscar_recursiva(no.esquerda, valor)
    else
      _buscar_recursiva(no.direita, valor)
    end
  end

  def buscar_iterativa(valor)
    no = @raiz
    while !no.nil? && no.valor != valor
      if valor < no.valor
        no = no.esquerda
      else
        no = no.direita
      end
    end
    no
  end

  def em_ordem(no = @raiz)
    return if no.nil?

    em_ordem(no.esquerda)
    print "#{no.valor} "
    em_ordem(no.direita)
  end
end

# Exemplo de uso:
arvore = ArvoreBuscaBinaria.new
valores = [5, 3, 7, 2, 4, 6, 8]

valores.each do |valor|
  arvore.inserir(valor)
end

puts "Em Ordem:"
arvore.em_ordem(arvore.raiz)

# Busca Recursiva
valor_busca = 4
resultado_busca_recursiva = arvore.buscar_recursiva(valor_busca)
if resultado_busca_recursiva
  puts "\nValor #{valor_busca} encontrado na árvore (Busca Recursiva)."
else
  puts "\nValor #{valor_busca} não encontrado na árvore (Busca Recursiva)."
end

# Busca Iterativa
resultado_busca_iterativa = arvore.buscar_iterativa(valor_busca)
if resultado_busca_iterativa
  puts "Valor #{valor_busca} encontrado na árvore (Busca Iterativa)."
else
  puts "Valor #{valor_busca} não encontrado na árvore (Busca Iterativa)."
end
