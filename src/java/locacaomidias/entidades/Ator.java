
package locacaomidias.entidades;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import java.sql.Date;

public class Ator {
    
    @NotNull
    private Long id;
    
    @NotNull
    @Size( min = 1, max = 45 )
    private String nome;
    
    @NotNull
    @Size( min = 1, max = 45 )
    private String sobrenome;
    
    @NotNull
    private Date data_estreia;
    
    

    public Long getId() {
    return id;
    }

    public void setId( Long id ) {
    this.id = id;
    }

    public String getNome() {
    return nome;
    }

    public void setNome( String nome ) {
    this.nome = nome;
    }

    public String getSobrenome() {
    return sobrenome;
    }

    public void setSobrenome( String sobrenome ) {
    this.sobrenome = sobrenome;
    }

    public Date getDataEstreia() {
    return data_estreia;
    }

    public void setDataEstreia( Date data_estreia ) {
    this.data_estreia = data_estreia;
    }
}
