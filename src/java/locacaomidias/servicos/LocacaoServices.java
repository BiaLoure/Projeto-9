package locacaomidias.servicos;

import java.util.ArrayList;
import java.util.List;
import locacaomidias.entidades.Locacao;
import locacaomidias.dao.LocacaoDAO;
import java.sql.*;
/**
 *
 * @author Samuel Iamarino
 */
public class LocacaoServices {
    public List<Locacao> getTodos(){
        
        List<Locacao> lista = new ArrayList<>();
        
        try ( LocacaoDAO dao = new LocacaoDAO() ) {
            lista = dao.listarTodos();
        } catch ( SQLException exc ) {
            exc.printStackTrace();
        }
        
        return lista;
    }
}
