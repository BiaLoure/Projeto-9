package locacaomidias.testes;

import java.sql.Date;
import java.sql.SQLException;
import locacaomidias.dao.EstadoDAO;
import locacaomidias.entidades.Estado;

/**
 *
 * @author Samuel Iamarino
 */
public class TesteDAOEstado {
    public static void main(String[] args) {
        EstadoDAO dao = null;
        
        Estado estado = new Estado();
        Estado ator2 = new Estado();
        
        estado.setId(Long.parseLong("1"));
        estado.setNome("EstadoPica");
        estado.setSigla("EP");
        
        
        try{
            
            dao = new EstadoDAO();
            dao.salvar(estado);
            
            
        }catch(SQLException exception){
            exception.printStackTrace();
        }finally{
            if(dao != null){
                try{
                    dao.close();
                }catch(SQLException e){
                    System.out.println("Erro ao fechar conexão");
                    e.printStackTrace();
                }
            }
        }
    }
}
