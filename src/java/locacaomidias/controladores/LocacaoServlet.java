package locacaomidias.controladores;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import locacaomidias.dao.ClienteDAO;
import locacaomidias.dao.LocacaoDAO;
import locacaomidias.entidades.Locacao;
import locacaomidias.entidades.Cliente;
import locacaomidias.utils.Utils;

/**
 *
 * @author Samuel Iamarino
 */
@WebServlet(name = "LocacaoServlet", urlPatterns = {"/processaLocacao"})
public class LocacaoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

            RequestDispatcher disp = null;
            String acao = request.getParameter("acao");

            try(LocacaoDAO daoLocacao = new LocacaoDAO();
                ClienteDAO daoCliente =  new ClienteDAO();){

                if(acao.equals("inserir")){
                    
                        int dataInicio = Integer.parseInt(request.getParameter("dataInicio"));
                        Date dataFim = Date.valueOf(request.getParameter("dataFim"));
                        boolean cancelada = Boolean.parseBoolean(request.getParameter("cancelada"));
                        Long clienteId = Long.valueOf( request.getParameter( "clienteSelecionado" ) );
                     
                        Cliente cliente = daoCliente.obterPorId(clienteId);

                        Locacao locacao = new Locacao();
                        locacao.setDataInicio(dataInicio);
                        locacao.setDataFim(dataFim);
                        locacao.setCancelada(cancelada);
                        locacao.setCliente(cliente);

                        Utils.validar( locacao, "idLocacao" );

                        daoLocacao.salvar(locacao);

                        disp = request.getRequestDispatcher(
                        "/formularios/locacoes/listagem.jsp");   
                        
                        if ( disp != null ) {
                            disp.forward( request, response );
                        }
                        
                } else if( acao.equals("alterar")){
                    
                        Long id = Utils.getLong( request, "idLocacao" );
                        int dataInicio = Integer.parseInt(request.getParameter("dataInicio"));
                        Date dataFim = Date.valueOf(request.getParameter("dataFim"));
                        boolean cancelada = Boolean.parseBoolean(request.getParameter("cancelada"));
                        Long clienteId = Long.valueOf( request.getParameter( "clienteSelecionado" ) );
                     
                        

                        Locacao locacao = daoLocacao.obterPorId( id );
                        Cliente cliente = daoCliente.obterPorId(clienteId);
                        
                        locacao.setDataInicio(dataInicio);
                        locacao.setDataFim(dataFim);
                        locacao.setCancelada(cancelada);
                        locacao.setCliente(cliente);

                        //id do objeto por isso esta com o nome de idLocacao
                        Utils.validar( locacao );

                        daoLocacao.atualizar(locacao);

                        disp = request.getRequestDispatcher(
                        "/formularios/locacoes/listagem.jsp");   
                        
                        
                    
                } else if (acao.contains("excluir")){
                    
                    //id do objeto por isso esta com o nome de idLocacao
                    Long id = Utils.getLong( request, "idLocacao" );
                    Locacao locacao = daoLocacao.obterPorId( id );
                    daoLocacao.excluir(locacao);
                    
                    disp = request.getRequestDispatcher(
                        "/formularios/locacoes/listagem.jsp"); 
                    
                } else {
                    
                    //id da listagem por isso esta com o nome de "id"
                    Long id = Utils.getLong( request, "id" );
                    Locacao locacao = daoLocacao.obterPorId( id );
                    request.setAttribute( "locacao", locacao );
                    
                    if ( acao.equals( "prepararAlteracao" ) ) {
                        disp = request.getRequestDispatcher( 
                                "/formularios/locacoes/alterar.jsp" );
                    } else if ( acao.equals( "prepararExclusao" ) ) {
                        disp = request.getRequestDispatcher( 
                                "/formularios/locacoes/excluir.jsp" );
                }
                    
                }
                    if ( disp != null ) {
                            disp.forward( request, response );
                    }
                    
                }
            catch(SQLException e){
                e.printStackTrace();
            }
        }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
