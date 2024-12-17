package locacaomidias.testes;

import java.sql.Date;
import locacaomidias.dao.LocacaoDAO;
import locacaomidias.entidades.Cidade;
import locacaomidias.entidades.Cliente;
import locacaomidias.entidades.Estado;
import locacaomidias.entidades.Locacao;
import java.sql.SQLException;
import java.time.LocalDate;
/**
 *
 * @author Samuel Iamarino
 */
public class TesteDAOLocacao {
    public static void main(String[] args) {
        LocacaoDAO dao = null;
        
        Locacao locacao = new Locacao();
        Estado estado = new Estado();
        Cidade cidade = new Cidade();
        Cliente cliente = new Cliente();
        
        estado.setId(Long.parseLong("1"));
        cidade.setId(Long.parseLong("1"));
        cliente.setId(Long.parseLong("1"));
        
        cidade.setEstado(estado);
        cliente.setCidade(cidade);
        locacao.setCliente(cliente);
        
        locacao.setIdLocacao(Long.parseLong("1"));
        locacao.setCancelada(false);
        locacao.setDataFim(Date.valueOf("2003-12-12"));
        locacao.setDataInicio(1920);
        
        
        
        
        try{
            
            dao = new LocacaoDAO();
            dao.atualizar(locacao);
            
            System.out.println(dao.obterPorId(Long.parseLong("1")).getDataInicio());
            
            
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
