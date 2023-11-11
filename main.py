class num:
    def __init__(self, valor):
        self.valor = valor
        self.esquerda = None
        self.direita = None

class ArvoreBuscaBinaria:
    def __init__(self):
        self.raiz = None

    def inserir(self, valor):
        self.raiz = self._inserir(self.raiz, valor)

    def _inserir(self, num, valor):
        if num is None:
            return num(valor)
        
        if valor < num.valor:
            num.esquerda = self._inserir(num.esquerda, valor)
        elif valor > num.valor:
            num.direita = self._inserir(num.direita, valor)

        return num

    def buscar(self, valor):
        return self._buscar(self.raiz, valor)

    def _buscar(self, num, valor):
        if num is None or num.valor == valor:
            return num
        if valor < num.valor:
            return self._buscar(num.esquerda, valor)
        return self._buscar(num.direita, valor)

    def em_ordem(self, num):
        if num:
            self.em_ordem(num.esquerda)
            print(num.valor, end=" ")
            self.em_ordem(num.direita)

# Exemplo de uso:
arvore = ArvoreBuscaBinaria()
valores = [5, 3, 7, 2, 4, 6, 8]

for valor in valores:
    arvore.inserir(valor)

print("Em ordem:")
arvore.em_ordem(arvore.raiz)

# Busca
valor_busca = 4
resultado_busca = arvore.buscar(valor_busca)

if resultado_busca:
    print({valor_busca})
else:
    print({valor_busca})