SELECT V.placa, C.nome
FROM Veiculo V
JOIN Cliente C ON V.cliente_cpf = C.cpf;


SELECT P.end, E.dtEntrada, E.dtSaida
FROM Patio P
JOIN Estaciona E ON P.num = E.Patio_num
JOIN Veiculo V ON E.Veiculo_placa = V.placa
WHERE V.placa = 'BTG-2022';