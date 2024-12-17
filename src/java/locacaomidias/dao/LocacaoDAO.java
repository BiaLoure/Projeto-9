package locacaomidias.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import locacaomidias.entidades.Cidade;
import locacaomidias.entidades.Cliente;
import locacaomidias.entidades.Estado;
import locacaomidias.entidades.Locacao;
import locacaomidias.utils.Utils;

/**
 *
 * @author Samuel Iamarino
 */
public class LocacaoDAO extends DAO<Locacao>{
    
    
    public LocacaoDAO() throws SQLException{
    
    }
    
    
    @Override
    public void salvar(Locacao obj) throws SQLException {
       
        PreparedStatement statement = getConnection().prepareStatement(
                """
                INSERT INTO locacao(data_inicio,data_fim,cancelada,cliente_id)
                VALUES(?,?,?,?);
                """,
                new String[]{ "insert_id" });
        
        statement.setInt(1, obj.getDataInicio());
        statement.setDate(2, obj.getDataFim());
        statement.setBoolean(3, obj.isCancelada());
        statement.setLong(4, obj.getCliente().getId());
        
        obj.setIdLocacao(Utils.getChavePrimariaAposInsercao( statement, "insert_id" ) );
        statement.executeUpdate();
        statement.close();
        
    }

    @Override
    public void atualizar(Locacao obj) throws SQLException {
        
        PreparedStatement statement = getConnection().prepareStatement(
                """
                UPDATE locacao 
                SET
                    data_inicio = ?,
                    data_fim = ?,
                    cancelada = ?,
                    cliente_id = ?
                WHERE
                    id = ?
                """
        );
        
        statement.setInt(1, obj.getDataInicio());
        statement.setDate(2, obj.getDataFim());
        statement.setBoolean(3, obj.isCancelada());
        
        statement.setLong(4, obj.getCliente().getId());
        statement.setLong(5, obj.getIdLocacao());
        
        statement.executeUpdate();
        
        statement.close();
        
        
    }

    @Override
    public void excluir(Locacao obj) throws SQLException {
        
        PreparedStatement statement = getConnection().prepareStatement(
                """
                DELETE FROM locacao 
                WHERE 
                    id = ?;
                """
        );
        
        statement.setLong(1,obj.getIdLocacao());
        
        statement.executeUpdate();
        statement.close();
        
        
    }

    @Override
    public List<Locacao> listarTodos() throws SQLException {
        
        List<Locacao> lista = new ArrayList<>();
        
        PreparedStatement statement = getConnection().prepareStatement(
                """
                SELECT 
                locacao.id AS locacao_id,
                locacao.data_inicio AS locacao_data_inicio,
                locacao.data_fim AS locacao_data_fim,
                locacao.cancelada as locacao_cancelada,
                
                cliente.id AS cliente_id,
                cliente.nome AS cliente_nome,
                cliente.sobrenome AS cliente_sobrenome,
                cliente.data_nascimento AS cliente_data_nascimento,
                cliente.cpf AS cliente_cpf,
                cliente.email AS cliente_email,
                cliente.logradouro AS cliente_lougradouro, 
                cliente.numero AS cliente_numero, 
                cliente.bairro AS cliente_bairro,
                cliente.cep AS cliente_cep,
                
                cidade.id AS cidade_id,
                cidade.nome AS cidade_nome,
                
                estado.id AS estado_id,
                estado.nome AS estado_nome,
                estado.sigla AS estado_sigla
                
                FROM locacao
                INNER JOIN cliente ON cliente.id = locacao.cliente_id
                INNER JOIN cidade ON cidade.id = cliente.cidade_id
                INNER JOIN estado ON estado.id = cidade.estado_id
                ; 
                """
        ); /*corrigir order by*/
        
        ResultSet set = statement.executeQuery();
        
        while( set.next() ){
            
            Locacao locacao = new Locacao();
            Cliente cliente = new Cliente();
            Cidade cidade = new Cidade();
            Estado estado = new Estado();
            
            locacao.setIdLocacao(set.getLong("locacao_id"));
            locacao.setDataInicio(set.getInt("locacao_data_inicio"));
            locacao.setDataFim(set.getDate("locacao_data_fim"));
            locacao.setCancelada(set.getBoolean("locacao_cancelada"));
            
            //Setando Cliente
            locacao.setCliente(cliente);
            
            cliente.setId(set.getLong("cliente_id"));
            cliente.setNome(set.getString("cliente_nome"));
            cliente.setSobrenome(set.getString("cliente_sobrenome"));
            cliente.setDataNascimento(set.getDate("cliente_data_nascimento"));
            cliente.setCpf(set.getString("cliente_cpf"));
            cliente.setEmail(set.getString("cliente_email"));
            cliente.setLogradouro(set.getString("cliente_lougradouro"));
            cliente.setNumero(set.getString("cliente_numero"));
            cliente.setBairro(set.getString("cliente_bairro"));
            cliente.setCep(set.getString("cliente_cep"));
            
            
            //setando cidade
            cliente.setCidade(cidade);
            
            cidade.setId(set.getLong("cidade_id"));
            cidade.setNome(set.getString("cidade_nome"));
            
            
            cidade.setEstado(estado);
            
            estado.setId(set.getLong("estado_id"));
            estado.setNome(set.getString("estado_nome"));
            estado.setSigla(set.getString("estado_sigla"));
            
            lista.add(locacao);
        }
        
        set.close();
        statement.close();
        
        return lista;
        
    }

    @Override
    public Locacao obterPorId(Long id) throws SQLException {
       
        Locacao locacao = null;
        
        PreparedStatement statement = getConnection().prepareStatement(
                """
                SELECT 
                locacao.id AS locacao_id,
                locacao.data_inicio AS locacao_data_inicio,
                locacao.data_fim AS locacao_data_fim,
                locacao.cancelada as locacao_cancelada,
                
                cliente.id AS cliente_id,
                cliente.nome AS cliente_nome,
                cliente.sobrenome AS cliente_sobrenome,
                cliente.data_nascimento AS cliente_data_nascimento,
                cliente.cpf AS cliente_cpf ,
                cliente.email AS cliente_email,
                cliente.logradouro AS cliente_lougradouro ,
                cliente.numero AS cliente_numero ,
                cliente.bairro AS cliente_bairro,
                cliente.cep AS cliente_cep,
                
                cidade.id AS cidade_id,
                cidade.nome AS cidade_nome,
                
                estado.id AS estado_id,
                estado.nome AS estado_nome,
                estado.sigla AS estado_sigla
                FROM locacao 
                
                INNER JOIN cliente ON cliente.id = locacao.cliente_id
                INNER JOIN cidade ON cidade.id = cliente.cidade_id
                INNER JOIN estado ON estado.id = cidade.estado_id
                
                WHERE locacao.id = ?;
                
                """
        ); /*colocar order by*/
        
        statement.setLong(1, id);
        
        ResultSet set = statement.executeQuery();
        
        if( set.next() ){
            locacao = new Locacao();
            Cliente cliente = new Cliente();
            Cidade cidade = new Cidade();
            Estado estado = new Estado();
            
            locacao.setIdLocacao(set.getLong("locacao_id"));
            locacao.setDataInicio(set.getInt("locacao_data_inicio"));
            locacao.setDataFim(set.getDate("locacao_data_fim"));
            locacao.setCancelada(set.getBoolean("locacao_cancelada"));
            
            //Setando Cliente
            locacao.setCliente(cliente);
            
            cliente.setId(set.getLong("cliente_id"));
            cliente.setNome(set.getString("cliente_nome"));
            cliente.setSobrenome(set.getString("cliente_sobrenome"));
            cliente.setDataNascimento(set.getDate("cliente_data_nascimento"));
            cliente.setCpf(set.getString("cliente_cpf"));
            cliente.setEmail(set.getString("cliente_email"));
            cliente.setLogradouro(set.getString("cliente_lougradouro"));
            cliente.setNumero(set.getString("cliente_numero"));
            cliente.setBairro(set.getString("cliente_bairro"));
            cliente.setCep(set.getString("cliente_cep"));
            
            
            //setando cidade
            cliente.setCidade(cidade);
            
            cidade.setId(set.getLong("cidade_id"));
            cidade.setNome(set.getString("cidade_nome"));
            
            //setando estado
            cidade.setEstado(estado);
            
            estado.setId(set.getLong("estado_id"));
            estado.setNome(set.getString("estado_nome"));
            estado.setSigla(set.getString("estado_sigla"));
        }
        
        set.close();
        statement.close();
        
        return locacao;
    }
    
}
