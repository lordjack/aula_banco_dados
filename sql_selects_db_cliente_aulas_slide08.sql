-- Q01 - Listar todos os itens do pedido;
SELECT * FROM itens_pedido;

-- Q02 - Listar os pedidos;
SELECT * FROM pedido;

-- Q03 - Listar Itens do pedido e pedido e cliente;
SELECT itens_pedido.id, itens_pedido.produto_id, itens_pedido.pedido_id,itens_pedido.quantidade,
	p.id, p.cliente_id, p.itens_pedido_id, p.data_pedido,
	c.*
 FROM itens_pedido ip, pedido p, cliente c;
 
 SELECT ip.*, p.*, c.*
 FROM itens_pedido ip, pedido p, cliente c;
 
 SELECT * FROM itens_pedido ip, pedido p, cliente c;
 
 -- Q04 - Listar Itens do pedido e pedido, cliente e produto;
 SELECT prod.nome_produto,ped.id,c.nome FROM itens_pedido ip, pedido ped, 
 		cliente c, produto prod 
 WHERE 
 	c.id = ped.cliente_id
 	AND 
	ped.id = ip.pedido_id
 	AND
 	prod.id = ip.produto_id;
 
 -- Q05 - Listar nome cliente, pedido, data, produto, quantidade e preço unitário;
 
 SELECT c.nome AS 'nome_cliente', ped.id, ped.data_pedido, prod.nome_produto,
 	prod.preco, ip.quantidade, (prod.preco * ip.quantidade) AS total_item
 
 FROM cliente c, pedido ped, produto prod, itens_pedido ip 
 WHERE 
 	c.id = ped.cliente_id
 	AND 
	ped.id = ip.pedido_id
 	AND
 	prod.id = ip.produto_id;
 ;
 
 
 