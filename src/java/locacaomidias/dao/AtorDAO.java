/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package locacaomidias.dao;

import locacaomidias.entidades.Ator;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AtorDAO extends DAO<Ator> {
    
    public AtorDAO() throws SQLException {
    }

    

    @Override
    public void salvar(Ator obj) throws SQLException {
        PreparedStatement stmt = getConnection().prepareStatement(
            "INSERT INTO " +
            "ator(nome,sobrenome,data_estreia) " +
            "VALUES( ?,?,? );" );

        stmt.setString( 1, obj.getNome() );
        stmt.setString( 2, obj.getSobrenome() );
        stmt.setDate( 3, obj.getDataEstreia() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void atualizar(Ator obj) throws SQLException {
        PreparedStatement stmt = getConnection().prepareStatement(
            "UPDATE ator " +
            "SET nome = ?," +   
            "sobrenome = ?," +   
            "data_estreia = ? " +  
            "WHERE" +
            " id = ?;" );

        stmt.setString( 1, obj.getNome() );
        stmt.setString( 2, obj.getSobrenome() );
        stmt.setDate( 3, obj.getDataEstreia() );
        stmt.setInt( 4, obj.getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void excluir(Ator obj) throws SQLException {
        PreparedStatement stmt = getConnection().prepareStatement(
            "DELETE FROM ator " +
            "WHERE" +
            " id = ?;" );

        stmt.setInt( 1, obj.getId() );
        stmt.executeUpdate();
        stmt.close();
    }

    @Override
    public List<Ator> listarTodos() throws SQLException {
        List<Ator> lista = new ArrayList<>();

    PreparedStatement stmt = getConnection().prepareStatement(
        "SELECT * FROM ator " +
        "ORDER BY id;" );

    ResultSet rs = stmt.executeQuery();
    while ( rs.next() ) {

        Ator a= new Ator();

        a.setId( rs.getInt( "id" ) );
        a.setNome( rs.getString( "nome" ) );
        a.setSobrenome( rs.getString( "sobrenome" ) );
        a.setDataEstreia( rs.getDate( "data_estreia" ) );
       

        lista.add( a );

    }

    rs.close();
    stmt.close();

    return lista;
    }

    public Ator obterPorId(int id) throws SQLException {
        Ator ator = null;

        PreparedStatement stmt = getConnection().prepareStatement(
            "SELECT * FROM ator " +
            "WHERE id = ?;" );
        stmt.setInt( 1, id );

        ResultSet rs = stmt.executeQuery();

        if ( rs.next() ) {

            ator = new Ator();

            ator.setId( rs.getInt( "id" ) );
            ator.setNome( rs.getString( "nome" ) );
            ator.setSobrenome( rs.getString( "sobrenome" ) );
            ator.setDataEstreia( rs.getDate( "data_estreia" ) );
           
        }

        rs.close();
        stmt.close();

        return ator;
    }

    @Override
    public Ator obterPorId(Long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void fecharConexao() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    
}
