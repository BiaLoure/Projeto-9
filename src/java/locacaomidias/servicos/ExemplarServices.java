package locacaomidias.servicos;

import java.util.List;
import java.util.ArrayList;
import java.sql.SQLException;
import locacaomidias.dao.ExemplarDAO;
import locacaomidias.entidades.Exemplar;

/**
 *
 * @author Bianca
 */
public class ExemplarServices {
    
    public List<Exemplar> getTodos() {
        
        List<Exemplar> lista = new ArrayList<>();
        
        try ( ExemplarDAO dao = new ExemplarDAO() ) {
            
            lista = dao.listarTodos();
        } catch ( SQLException e ) {
            e.printStackTrace();
        }
        
        return lista;
    }
    
}
