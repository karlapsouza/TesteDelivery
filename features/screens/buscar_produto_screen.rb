module BuscarProdutoScreen

    def elemento_tela
    {
        id_sim_maior_18: '#btn-age-yes', 
        class_botao_entrega: '.sc-bsbRJL.gEUOKk', 
        id_campo_endereco: '#pacInput', 
        class_titulo: '.sc-bYSBpT.kVEFtI',
        class_botao_verproduto: '.sc-hzDkRC.eDcQTW', 
        class_selecionar_endereco: '.pac-matched', 
        id_campo_numero: '#numberInput',
        class_campo_complemento: '.sc-eqIVtm.ccgfQa',
        class_campo_tipoproduto: '.user-dropdown-select',
        id_campo_busca: '.search-bar',
        id_lupa: '#glass-product',
        class_selecionar_produto: '.product-card display-flex.column.flex',
        class_campo_quantidade: '.user-text-input-wrapped',
        class_label_preco: '.products-cart-price',
        class_botao_fecharconta: '.products-cart-button'
    }
    end 

    def clicar_elemento(elemento)  
        cap = Capybara::Node::Element 
        botao = find(elemento).click
        fail "Não foi possível clicar no elemento #{elemento}" unless botao.is_a?cap
    end

    def clicar_elemento_index(elemento, index)  
        cap = Capybara::Node::Element 
        byebug
        botao = find((elemento)[index]).click
        fail "Não foi possível clicar no elemento #{elemento}" unless botao.is_a?cap
    end


    def preencher_campo(elemento, valor)
        cap = Capybara::Node::Element
        campo = find(elemento).send_keys(valor)
        fail "Não foi possível preencher o campo #{elemento}" unless campo.is_a?cap
    end

    def existe_elemento?(elemento)
        visivel = find(elemento).visible?
        fail "Elemento #{elemento} não encontrado" unless visivel
        visivel
     end

     def aguardar_ficar_presente(elemento, tempo_segundos)
        item = find(elemento).visible?
        if item == false
            sleep(tempo_segundos)
        end
        fail "Elemento #{elemento} não encontrado" unless item
     end

    def verifica_idade()
        if existe_elemento?(elemento_tela[:id_sim_maior_18])
            clicar_elemento(elemento_tela[:id_sim_maior_18])  
        end
    end

    def preencher_endereco(rua, numero, complemento)
        if existe_elemento?(elemento_tela[:class_botao_entrega])
            preencher_campo(elemento_tela[:id_campo_endereco], rua)
            clicar_elemento(elemento_tela[:class_titulo])
            clicar_elemento(elemento_tela[:id_campo_endereco])
            byebug
            clicar_elemento_index(elemento_tela[:class_selecionar_endereco],1)
        end
        if existe_elemento?(elemento_tela[:id_campo_numero])
            preencher_campo(elemento_tela[:id_campo_numero], numero)
            preencher_campo(elemento_tela[:class_campo_complemento], complemento)
        end
        clicar_elemento(elemento_tela[:class_botao_verproduto])
    end

    def buscar_produto(produto)
        preencher_campo(elemento_tela[:id_campo_busca], produto)
        clicar_elemento(elemento_tela[:id_lupa])
    end

    def selecionar_produto(quantidade)
        clicar_elemento(elemento_tela[:class_selecionar_produto])
        preencher_campo(elemento_tela[:class_campo_quantidade], quantidade)
        if(elemento_tela[:class_label_preco].text > "15")
            clicar_elemento(elemento_tela[:class_botao_fecharconta])
        end
    end
end
    